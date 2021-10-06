from django.db import models

# Create your models here.
class UserRegistration(models.Model):
    firstName = models.CharField(max_length=200)
    lastName = models.CharField(max_length=200)
    userName = models.CharField(max_length=200)
    password = models.CharField(max_length=50)
    mobilenum = models.BigIntegerField()
    emailId = models.EmailField()
    location = models.CharField(max_length=100)
    dob = models.DateField()

class Docs(models.Model):
    user = models.ForeignKey(UserRegistration)
    title = models.CharField(max_length=200)
    original_cluster = models.CharField(max_length=200)
    update_original_cluster = models.CharField(max_length=200)
    cluster = models.CharField(max_length=200,default='pending')
    improved_cluster = models.CharField(max_length=200,default='pending')
    document = models.FileField(upload_to='doc/')

class Categories(models.Model):
    user = models.ForeignKey(UserRegistration)
    category = models.CharField(max_length=200)
    key_words = models.CharField(max_length=200)