
# import os
# Directory= "C:\Users\MediaHelp\detr_application_wider_face\Nouveau dossier"
# for  i, folder in enumerate(os.listdir(Directory)):
#         # folder{str(i)}= f"./remamed_{folder}"
#         folder= f"./remamed_{folder}"
#         #path=os.path.join(Directory, folder{str(i)})
#         path=os.path.join(Directory, folder)
#         os.mkdir(path) 
#         for count, filename in enumerate(os.listdir(folder)):
#             dst = f"part_{str(5)}_train_{str(1)}_{folder}_{str(count)}.jpg"
#             src = f"{Directory}/{folder }/{filename}/"
#             #dst= f"{folder{str(i)}/{dst}"
#             dst= f"folder/{dst}"
#             dst=os.path.expanduser(dst)
#             os.rename(src, dst)



#from gc import DEBUG_STATS
import os
import glob
from glob import glob
import string

#for j =1: 4
     #Directory = uigetdir('\content\gdrive\MyDrive\Colab Notebooks\first trial\basics_for_infrared_detection\dataset\LSOTB-TIR_TrainingData\Annotations\TrainingData\' ,'Select Input-Directory');
Directory=os.getcwd()

   #folder ="C:/Users/MediaHelp/detr_application_wider_face/Nouveau dossier/mimi"

for i, folder in enumerate(os.listdir(Directory)):
    
      for count, filename in enumerate(glob(f'{folder}/*.jpg')):
            #dst = f"part_{5}_train_{1}_{folder}_({filename}.split('\\')[-1])"
            dst_part1 = f"part_{5}_train_{1}_{folder}_"
            
            dst_part2= f"{filename}".split('\\')[-1]
            dst= f"{dst_part1}{dst_part2}"
            dst=f"{Directory}/{folder }/{dst}"
            #.split('\\')[-1].split('.')[-2]
            #dst = f"part_{5}_train_{1}_{folder}_{str(count)}.jpg"
            #src = f"{Directory}/{folder }/{filename}/"
            #dst= glob(f"{Directory}/{folder }/{dst}")
            os.rename(  filename, dst )

            #filename.split('.')[-2]
            
  #end


            
