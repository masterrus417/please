from django.db import models

class RequestsList(models.Model):
    database = 'please'

    entity_id = models.AutoField(primary_key=True)
    label_list = models.TextField(blank=True)
    attr_list = models.TextField(blank=True)
    
    class Meta:
        managed = False
        db_table = 'request_view_list'