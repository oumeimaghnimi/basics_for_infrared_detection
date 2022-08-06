import time
from zipfile import ZipFile
begin = time.time()
zip_loc="TIR_training_004.zip"
with ZipFile(zip_loc, 'r') as zip:
    print("available files in zip :\n")
    zip.printdir()
    print('\nExtracting all the files now...')
    zip.extractall('/content/gdrive/My Drive/Colab Notebooks/first trial/basics_for_infrared_detection/dataset/LSOTB-TIR_TrainingData_part5/TIR_training_004_extracted')
    print('Unzipping Done!')
end = time.time()
print(f"\nTotal runtime of this code block is {end - begin}")


#The notebook server will temporarily stop sending output to the client in order to avoid crashing it.
#To change this limit, set the config variable
# `--NotebookApp.iopub_data_rate_limit`.

#Current values:
#NotebookApp.iopub_data_rate_limit=1000000.0 (bytes/sec)
# NotebookApp.rate_limit_window=3.0 (secs)
