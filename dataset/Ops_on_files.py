

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
destination_folder = '/content/gdrive/MyDrive/Colab Notebooks/first trial/basics_for_infrared_detection/dataset/LSOTB-TIR_TrainingData_part5/TIR_training_004_extracted/TIR_training_004_videos/'

# fetch all files
for file_name in os.listdir(source_folder):
    
    # construct full file path
    source = source_folder + file_name
    destination = destination_folder + file_name
    # move only files
    if os.path.isfile(source):
       shutil.move(source, destination)
       print('Moved:', file_name)
    
