from django.http import HttpResponse
from django.shortcuts import render

import subprocess

# Create your views here.
def index(request):
    svn_url = 'https://subversion.assembla.com/svn/codelynks^Clertrust.trustme/'
    username = 'bibin.paul'  # Replace with your SVN username
    password = 'QaS9}~GW~=Y;v)V'  # Replace with your SVN password

    command = ['svn', 'log', '--stop-on-copy', '--xml','--username', username, '--password', password,svn_url]
    result = subprocess.run(command, capture_output=True, text=True)
    print("================================================") 
    print(result) 
    return HttpResponse("Hello World!asdv2")
