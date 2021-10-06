from heapq import nlargest

from django.db.models import Count
from django.shortcuts import render, redirect

# Create your views here.
from Text_Classification_for_newsgroup import settings
from user.forms import DocForm
from user.models import UserRegistration, Docs


def registration(request):
    if request.method == 'POST':
        firstName = request.POST.get('firstName')
        lastName = request.POST.get('lastName')
        userName = request.POST.get('userName')
        password = request.POST.get('password')
        mobilenum = request.POST.get('mobilenum')
        emailId = request.POST.get('emailId')
        location = request.POST.get('location')
        dob = request.POST.get('dob')
        if UserRegistration.objects.create(firstName=firstName,lastName=lastName,userName=userName,password=password,mobilenum=mobilenum,emailId=emailId,location=location,dob=dob):
            return redirect('login')
    return render(request, 'user/registration.html')

def login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        try:
            user_object = UserRegistration.objects.get(userName=username, password=password)
        except:
            user_object = None
        if user_object is not None:
            request.session['user_id']=user_object.id
            return redirect('home')
    return render(request,'user/login.html')

def home(request):
    uid = request.session['user_id']
    user = UserRegistration.objects.get(id=uid)
    doc_obj = Docs.objects.filter(user=user)

    return render(request, 'user/home.html',{'doc_obj':doc_obj})

def remove(request,did):
    docobj = Docs.objects.get(id=did)
    docobj.delete()
    return redirect('home')

def uploadFile(request):
    if request.method == "POST":
        form = DocForm(request.POST,request.FILES)
        if form.is_valid():
            form_obj = form.save(commit=False)
            uid=request.session['user_id']
            user=UserRegistration.objects.get(id=uid)
            form_obj.user=user
            form_obj.save()
            return redirect('home')
    else:
        form = DocForm()
    return render(request,'user/uploadfiles.html',{'form':form})

def docanalysis(request):
    uid = request.session['user_id']
    user = UserRegistration.objects.get(id=uid)
    doc_obj = Docs.objects.all()
    return render(request,'user/docanalysis.html',{'doc_obj':doc_obj})
def analysissingle(request,did):
    res="user"
    doc_obj = Docs.objects.get(id=did)
    de = doc_obj.document.url
    d = de[6:]
    my_list = []
    edcount,bcount,scount,fcount,acount,ecount,hcount,buscount,encount,polcount = 0,0,0,0,0,0,0,0,0,0
    edw,bw,sw,fw,aw,ew,hw,bus,enw,pow=[],[],[],[],[],[],[],[],[],[]
    eod = settings.MEDIA_ROOT + d
    with open(eod, 'r', encoding="utf8") as f:
        for line in f:
            for word in line.split():
                if word in ('electronic', 'electric', 'semiconductors','circuits','transistors','sensors'):
                    ecount = ecount+1
                    ew.append(word)
                elif word in ('bat', 'ball', 'playing','racquets','league','energy','exercise','guards','team','umpires','energy drink','stadium','ground','nets','lower','jersey'):
                    scount = scount + 1
                    sw.append(word)
                elif word in ('make up','medicure','pedicure','clothes','ornaments','jewels','foundation','beauty parlour','parlour','catalogue'):
                    fcount = fcount + 1
                    fw.append(word)
                elif word in ('vegetable', 'vegetables', 'recipe', 'kitchen','vegetable','fruits','ingredients','dining table','plates'):
                    acount = acount + 1
                    aw.append(word)
                elif word in ('reading','author', 'publication', 'reader'):
                    bcount = bcount + 1
                    bw.append(word)
                elif word in ('medicine', 'doctor', 'stethoscope','glucose','nurse','hospital','patient','surgery','therapy','prescription','diseases','treatment','affection'):
                    hcount = hcount + 1
                    hw.append(word)
                elif word in ('study', 'teacher', 'student','scholar','doctarate','school','college','marks','exam','marksheet','examination','placement','professor','alumni','graduation'):
                    edcount = edcount + 1
                    edw.append(word)
                elif word in ('client','commercial','business','dealing','trade','office','tender','tertiary','market','enterprise','privately','e-commerce'):
                    buscount = buscount + 1
                    bus.append(word)
                elif word in ('edutainment','music','film','theater','fun','cinema','media','tv','programming','movies','enjoyment',):
                    encount = encount + 1
                    enw.append(word)
                elif word in ('parliament','party','publicly','ministerial','moderate','polity','independent','communism','political','vote','elections', ):
                    polcount = polcount + 1
                    pow.append(word)
                my_list.append(word)
    f.close()
    data={}
    dat = [bcount,scount,fcount,acount,ecount,hcount]
    largest = nlargest(1, dat)
    cat = "others"
    a=None
    if bcount>scount or bcount>fcount or bcount>acount or bcount>ecount or bcount>hcount or bcount>edcount or bcount>buscount or bcount>encount or bcount>polcount:
        cat = "Books"
        a = list(set(bw))
    elif scount>bcount or scount>fcount or scount>acount or scount>ecount or scount>hcount or scount>edcount or scount>buscount or scount>encount or scount>polcount:
        cat = "Sports"
        a = list(set(sw))
    elif fcount>bcount or fcount>scount or fcount>acount or fcount>ecount or fcount>hcount or fcount>edcount or fcount>buscount or fcount>encount or fcount>polcount:
        cat = "Fashion"
        a = list(set(fw))
    elif acount>bcount or acount>scount or acount>fcount or acount>ecount or acount>hcount or acount>edcount or acount>buscount or acount>encount or acount>polcount:
        cat = "Cooking"
        a = list(set(aw))
    elif ecount>bcount or ecount>scount or ecount>fcount or ecount>acount or ecount>hcount or ecount>edcount or ecount>buscount or ecount>encount or ecount>polcount:
        cat = "Electronics"
        a = list(set(ew))
    elif hcount>bcount or hcount>scount or hcount>fcount or hcount>acount or hcount>ecount or hcount>edcount or hcount>buscount or hcount>encount or hcount>polcount:
        cat = "Healthcare"
        a = list(set(hw))
    elif edcount>bcount or edcount>scount or edcount>fcount or edcount>acount or edcount>hcount or edcount>ecount or edcount>buscount or edcount>encount or edcount>polcount:
        cat = "Education"
        a = list(set(edw))
    elif buscount>bcount or buscount>scount or buscount>fcount or buscount>acount or buscount>hcount or buscount>ecount or buscount>edcount or buscount>encount or buscount>polcount:
        cat = "Business"
        a = list(set(bus))
    elif encount>bcount or encount>scount or encount>fcount or encount>acount or encount>hcount or encount>ecount or encount>edcount or encount>buscount or encount>polcount:
        cat = "Entertainment"
        a = list(set(enw))
    elif polcount>bcount or polcount>scount or polcount>fcount or polcount>acount or polcount>hcount or polcount>ecount or polcount>edcount or polcount>buscount or polcount>encount:
        cat = "Political"
        a = list(set(pow))
    else:
        cat="Others"
    doc_obj.cluster = cat
    doc_obj.save(update_fields=['cluster'])
    data['wordssat'] = a
    data['doc_obj']=doc_obj
    data['res']=res
    data['bcount']=bcount
    data['scount']=scount
    data['fcount']=fcount
    data['acount']=acount
    data['ecount']=ecount
    data['larger']=cat
    data['mywords']=a
    data['my_list']=my_list
    return render(request,'user/analysissingle.html',data)

def analysis_chart(request,chart_type):

    clusterw = Docs.objects.all().values('original_cluster').annotate(total=Count('original_cluster'))

    return render(request,'user/graph1.html',{'chart_type':chart_type,'objects':clusterw})

