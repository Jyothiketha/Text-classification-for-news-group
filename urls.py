"""Text_Classification_for_newsgroup URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from django.conf.urls.static import static
from django.contrib import admin

from Text_Classification_for_newsgroup import settings
from user import views as user_views

urlpatterns = [
    url(r'^admin/', admin.site.urls),

    url(r'^$',user_views.login, name='login'),
    url(r'^registration/$',user_views.registration, name='registration'),
    url(r'^home/$',user_views.home, name='home'),
    url(r'^remove-document/(?P<did>\d+)/$',user_views.remove, name='remove'),
    url(r'^upload-document/$',user_views.uploadFile, name='uploadfile'),
    url(r'^analysis-list/$', user_views.docanalysis, name='analysislist'),
    url(r'^analysis/(?P<did>\d+)/$',user_views.analysissingle, name='analysisdoc'),
    url('analysis_chart/(?P<chart_type>\w+)', user_views.analysis_chart, name="analysis_chart"),
]
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)