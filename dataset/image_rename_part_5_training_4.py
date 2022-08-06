import os
import glob
from glob import glob
import string

#for j =1: 4
     #Directory_image = uigetdir('\content\gdrive\MyDrive\Colab Notebooks\first trial\basics_for_infrared_detection\dataset\LSOTB-TIR_TrainingData\TrainingData\' ,'Select Input-Directory');

#Directory_image= '/content/gdrive/MyDrive/Colab Notebooks/first trial/basics_for_infrared_detection/dataset/LSOTB-TIR_TrainingData_part5/TIR_training_004_images\'
Directory_image = cwd

for i, folder in enumerate(os.listdir(Directory_image)):
    
    for count, filename in enumerate(glob(f'{folder}/*.jpg')):
       #filename =horse_005/00000288.jpg
     
        dst_part1 = f"part_{5}_train_{4}_{folder}_"
            
        dst_part2= f"{filename}".split('/')[-1]
        dst= f"{dst_part1}{dst_part2}"
        dst=f"{Directory_image}/{folder}/{dst}"
        filename = f"{Directory_image}/{filename}"
            #dst= glob(f"{Directory}/{folder }/{dst}")
        os.rename(filename, dst)
     
     
 # verification
'''
 cwd = os.getcwd()
 print(cwd)
 os.listdir(Directory_image + '/truck_006/')
 '''

           
            

