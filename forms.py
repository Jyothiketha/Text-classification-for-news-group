from django import forms

from user.models import UserRegistration,Docs


class UserRegistrationForm(forms.ModelForm):
    class Meta:
        model = UserRegistration
        fields = ('firstName','lastName','userName', 'password', 'mobilenum', 'emailId', 'location', 'dob',)

class DocForm(forms.ModelForm):
    class Meta:
        model = Docs
        fields = ('title', 'document','original_cluster')