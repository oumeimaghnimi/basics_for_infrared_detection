# Transformers-on-LSOTB

Usage:

   1. Download the LSOTB  training dataset parts(part_1, part_2, part_3, part_4, part_5) and put it into  folder called dataset.
   2.  Change every frame sequence in the dataset to a video:
         frame_to_video.py
   2. Rename   "{part_{}_train_{}_path}\ . \*.jpg"   to     "part_{}_train_{}_{}_%d.jpg"
                              image_rename.py
  3.  Convert Xml files to Matlab structure (Python programming)
                        parseXMLsequencet.m
  4. Rename  "{part_{}_train_{}_path}\ . \*.xml " files to    "part_{}_train_{}_{}_%d.xml" (Python programming)
       for h = 1:length(F)
             movefile(sprintf('%s',f ,'\',F(h).name),sprintf('%s',f ,'\',            
              sprintf('part_5_train_%d_',j),G(k).name,'_', F(h).name) )
        end
  5. For each part:
                   effectiveexercice_manyevent_sequence_only_one_script_test.m

    event_listsequence =                                                                                    'TIR_training_001/airplane_002'
    face_bbx_list_sequence (x1, y1, w, h/ xmin, ymin, xmax, ymax)=            '115'   '172'	'220'	'226'
    file_listsequence:                                                                                           '00000001'   ---  'part_{}_train_{}_{}_%d'
    occlusion_label_list_sequence =                                                                0
    track_label_list_sequence=            


    Mat_all_part5.event_list{j,1} = event_list_train1_part5;
    Mat_all_part5.file_list{j,1} = file_list_train1_part5;
    Mat_all_part5.bbx_list{j,1} = face_bbx_list_train1_part5;
    Mat_all_part5.occlusion_label_list{j,1}= occlusion_label_list_train1_part5;
    Mat_all_part5.track_label_list{j,1} = track_label_list_sequence;                                                             1

6- Combine/concatenate  Matlab cells of all training part annotations in one Workspace.  
             event_list
              file_list
              bbx_list
              bbx_list
              occlusion_label_list
              track_label_list

                                     ----->LSOTB_TIR_{train}.mat

7-   Maintain images and their annotations in a proper root and build   "{train}.json" files
         ./dataset/ LSOTB_TIR_{train}/images/
                      / LSOTB_TIR__annotations/LSOTB_TIR_{train}.mat
                         lsotb_to_coco.py

8- data_path =  ./dataset/



7- Training from scratch

python3  main.py    --dataset_file  lotsb    --data_path    ../dataset/ 
 --output_dir  output   --resume    weights/detr-r50-e632da11.pth 

7- Transfer learning (use pretrained weights) #--data_path= ../dataset/ 
python3  main.py    --dataset_file  lotsb    --data_path  ../dataset/ 
 --output_dir  output  --resume    weights/detr-r50-e632da11.pth 

8- Evaluation/visualization  #--data_path =  ../dataset/WIDER_val/images/          pretrained weights= output/checkpoint.pth 

     python3  test.py    --dataset_file  lotsb    --data_path    ../dataset/WIDER_val/images/   --output_dir  output    --resume    output/checkpoint.pth 



10- Demo:

dataset:   img_folder, ann_file(.json)                          build_dataset
                  transforms.
                               import torchvision.transforms as T
                               import datasets.transforms as T               (in Detr folder) #Transforms and data augmentation for both image + bbox.

model:                                                                              build _model




def build(image_set, args):
    # image_set = "train"  ,  image_set = "val" 
    root = Path(args.data_path)
    assert root.exists(), f'provided lsotb path {root} does not exist'
    mode = 'instances'
    PATHS = {
        "train": (root / "LSOTB_TIR_train/images", root /  f'train.json'),
        "val": (root / "LSOTB_TIR_val/images", root / f'val.json'),
    }

    img_folder, ann_file = PATHS[image_set]
    dataset = lsotbDetection(img_folder, ann_file, transforms=make_lsotb_transforms(image_set), return_masks=args.masks)
    return dataset.




checklist for training a model:


dataset_train = build_dataset(image_set='train', args=args)
dataset_val = build_dataset(image_set='val', args=args)
model, criterion, postprocessors = build_model(args)
optimizer & LR scheduler
data sampling:
Sampler_train
            batch_sampler_train                   collate_fn=collater= datasets.swig.collater
data loading :
data_loader_train 
train_one_epoch
 test_stats, coco_evaluator = evaluate(
            model, criterion, postprocessors, data_loader_val, base_ds, device, args.output_dir )










        


                                  
