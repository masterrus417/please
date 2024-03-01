from django.shortcuts import render
from RequestsList.models import RequestsList


def start_page(request):
    return render(request,'base.html')


def requests_list(request):
    requests_list_labels = RequestsList.objects.values_list('label_list').first()
    
    requsets_values = {}
    labels_list = requests_list_labels[0].split(';')
    
    requests_list_values = RequestsList.objects.values_list('entity_id','attr_list').all()

    
    for val in requests_list_values:
        requsets_values[val[0]] = val[1].split(';')
    
    print(requsets_values)

    return render(request,'requests_list.html',{'labels_list' : labels_list, 'requsets_values' : requsets_values})

