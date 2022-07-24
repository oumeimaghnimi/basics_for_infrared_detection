""" import cv2
import numpy as np
import PIL.Image as Image



img = Image.open("00000001.jpg")
# WIDTH and HEIGHT are integers
( img_w, img_h) = img.size
 
# choose codec according to format needed
fourcc = cv2.VideoWriter_fourcc(*'mp4v') 
video = cv2.VideoWriter('video.avi', fourcc, 1, (img_w, img_h))

for i in range(0,1):
    img = cv2.imread(str(i) + '.png')
    video.write(img)

cv2.destroyAllWindows()
video.release()


demain faire un fichier string comme coco """


#img = Image.open("00000001.jpg")
# WIDTH and HEIGHT are integers
# ( img_w, img_h) = img.size

target_dir="C:/Users/MediaHelp/detr_application_wider_face/testvideogeneration/mimi"
#target_dir= "C:/Users/MediaHelp/detr_application_wider_face/Nouveau dossier/mimi"

import cv2
import numpy as np
import glob
import PIL.Image as Image
img_array=[]
for filename in glob.glob(f'{target_dir}/*.jpg'):
    img = Image.open(filename)
    (width, height)=img.size
    size=(width, height)
    imgcv=cv2.imread(filename)
    #img.shape
    img_array.append(imgcv)
out=cv2.VideoWriter('project.avi', cv2.VideoWriter_fourcc(*'DIVX'), 15, size)
for i in range(len(img_array)):
    out.write(img_array[i])
out.release()


