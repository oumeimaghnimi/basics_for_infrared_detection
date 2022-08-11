

#Remove files:
!pip  install os --upgrade
import os
import glob

for filename in glob.glob(f'{os.getcwd()}/*.jpg'):
    os.remove(filename)

#list of files and directories inside a directory
Directory_image = cwd
os.listdir(Directory_image)



#Move files or folders
import os
import shutil

#source_folder = r"E:\pynative\reports\\"
#destination_folder = r"E:\pynative\account\\"
source_folder = os.getcwd()
destination_folder = '/content/gdrive/MyDrive/Colab_Notebooks/first trial/basics_for_infrared_detection/dataset/LSOTB-TIR_TrainingData_part5/TIR_training_004_extracted/TIR_training_004_videos/'

# fetch all files
for file_name in os.listdir(source_folder):
    
    # construct full file path
    source = source_folder + file_name
    destination = destination_folder + file_name
    # move only files
    if os.path.isfile(source):
       shutil.move(source, destination)
       print('Moved:', file_name)
        
# add_paths on octave 
from os import listdir
G_img=listdir('/content/gdrive/MyDrive/Colab_Notebooks/first_trial/basics_for_infrared_detection/dataset/LSOTB-TIR_TrainingData_part5/TIR_training_004/TIR_training_004_ann') 
count = 0
while count <len(G_img)-2 :
      G_img[count] = '/gdrive/MyDrive/Colab_Notebooks/first_trial/basics_for_infrared_detection/dataset/LSOTB-TIR_TrainingData_part5/TIR_training_004/TIR_training_004_ann/' + G_img[count]
      count += 1

G_img =G_img[: len(G_img)-3]
G_img


!octave --path  "/gdrive/MyDrive/Colab_Notebooks/first_trial/basics_for_infrared_detection/dataset/LSOTB-TIR_TrainingData_part5/TIR_training_004/TIR_training_004_ann/Get_mat_function.m"
    >cwd = pwd
    >annotationmat = Get_mat_function_octave(cwd)
    
    
%https://octave2work.blogspot.com/2017/03/new-package-installation-steps.html:
if problem as described below occured means
ubuntu:pkg install -forge io : please install the Debian package "liboctave-dev" to get the mkoctfile command       
        
>uname
 ans =

  scalar structure containing the fields:

    sysname = Linux
    nodename = 930013201d55
    release = 5.4.188+
    version = #1 SMP Sun Apr 24 10:03:06 PDT 2022
    machine = x86_64   
    
    > version  
      ans = 4.2.2
    >sudo apt-get install liboctave-dev     
    
%pkg load io;

https://lists.gnu.org/archive/html/help-octave/2017-03/msg00169.html:
http://wiki.octave.org/Cookbook#Load_XML_files   
https://octave.sourceforge.io/io/function/xmlread.html
From the page xmlread is a function of io package of octave-forge 
but is not octave core one.

1. install io package
From octave prompt

pkg install -forge io

This is required once.
To confirm io package is installed, execute

pkg list io

2. load io package. 
From octave prompt

pkg load io

This is required for  every time before you want use the package.

If you want to load io package at octave startup,
you can use startup file.

https://www.gnu.org/software/octave/doc/interpreter/Startup-Files.html#Startup-Files
Usually I use 
~/.octaverc


If you are a unix like os user, you know what ~ means.
~ indicates home directory.
On windows, home directory is C:\Users\<user name>.

Use an editor and make  .octaverc file in home directory and describe


javaaddpath ("/path/to/xerces-2_11_0/xercesImpl.jar");
javaaddpath ("/path/to/xerces-2_11_0/xml-apis.jar");
pkg load io;

and save it.    
    



To use io package,
        pkg install -forge io
        pkg list io
        pkg load io

 See 'help pkg' for available actions.    
