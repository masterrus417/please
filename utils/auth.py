from django.contrib.auth.middleware import RemoteUserMiddleware
from django.contrib.auth.backends import RemoteUserBackend
from main.settings.settings import REMOTE_USER_HEADER


class DisableCSRFMiddleware(object):
    def __init__(self, get_response):
        self.get_response = get_response

    def __call__(self, request):
        setattr(request, '_dont_enforce_csrf_checks', True)
        response = self.get_response(request)
        return response


class CustomRemoteUserMiddleware(RemoteUserMiddleware):
    '''
    Изменяет имя заголовка, который используется для аутентификации
    по умолчанию REMOTE_USER, в локали (runserver) LOGNAME, на веб сервере HTTP_X_REMOTE_USER
    смотрит в переменную в settings, изменится в зависимости от локальной/деплойной конфигурации
    '''
    header = REMOTE_USER_HEADER


class CustomRemoteUserBackend(RemoteUserBackend):
    '''
    Управляет возможностью автоматического создания пользователя при отсутствии учётных данных в БД,
    путём переопределения переменной create_unknown_user, в засимости от переметра CREATE_UNKNOWN_USER
    в settings. При отсутствии данного параметра create_unknown_user = False.
    '''
    try:
        from main.settings.settings import CREATE_UNKNOWN_USER
        create_unknown_user = CREATE_UNKNOWN_USER
    except:
        create_unknown_user = False

    def clean_username(self, username):
        '''
        Метод приводит возвращаемый серевером username в формат используемый в БД.
        '''
        _username, domain = username.split('@')
        cleaned_username = _username + '@' + domain.upper()
        return cleaned_username
