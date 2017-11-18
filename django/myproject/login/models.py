from django.db import models
from django.contrib.auth.models import User


# Create your models here.
class Profile(models.Model):
    user = models.ForeignKey(User)
    fb_id = models.CharField(max_length=500, blank=True)
    first_name = models.CharField(max_length=500, blank=True)
    last_name = models.CharField(max_length=500, blank=True)

    def __str__(self):
        return self.first_name + '.' + self.last_name

