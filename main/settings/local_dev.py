# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'XXX_pizdec_XXX'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# Database
# https://docs.djangoproject.com/en/2.2/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'HOST': 'eci-db1-dev.eci.local',
        'PORT': '5432',
        'NAME': 'cscd',
        'SCHEME': 'auth',
        'USER': 'django_auth_user',
        'PASSWORD': 'django_auth_user',
        'OPTIONS': {
                },  
    },
    'ref_user': {
        'ENGINE': 'django.db.backends.postgresql',
        'HOST': 'eci-db1-dev.eci.local',
        'PORT': '5432',
        'NAME': 'cscd',
        'SCHEME': 'sc_acc',
        'USER': 'django_auth_user',
        'PASSWORD': 'django_auth_user',
        'OPTIONS': {
                },  
    },
    'please':{
        'ENGINE': 'django.db.backends.postgresql',
        'HOST': 'eci-db1-dev.eci.local',
        'PORT': '5432',
        'NAME': 'cscd',
        'SCHEME': 'pls',
        'USER': 'please_user',
        'PASSWORD': 'please',
                'OPTIONS': {
                },  
    }
}

REMOTE_USER_HEADER = 'LOGNAME'

# SECURE_PROXY_SSL_HEADER = ('HTTPS', 'on')
# SECURE_SSL_REDIRECT = True