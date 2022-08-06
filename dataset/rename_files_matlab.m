
%first step: add all folders and subfolders and scripts to path by double
%clic and choose add to path

for j =1: 4
    %folder_ann = uigetdir('H:\video_to_apply_SSL\LSOTB-TIR_TrainingData\test_sur_four_lstob\','Select Input-folder-annotations'); 
    %folder_ann = uigetdir('D:\Matlab C\TLBO\test_sur_four_lstob' ,'Select Input-folder-annotations');
    folder_ann = uigetdir('\content\gdrive\MyDrive\Colab Notebooks\first trial\basics_for_infrared_detection\dataset\LSOTB-TIR_TrainingData\Annotations\' ,'Select Input-folder');
    
   %choice between TIR_training_001, TIR_training_002, TIR_training_003,etc.
    %folder_ann= H:\video_to_apply_SSL\LSOTB-TIR_TrainingData\Annotations\test_sur_four_lstob\TIR_training_001
         % in workspace (type: string)
    folder_ann = '/content/gdrive/MyDrive/Colab Notebooks/first trial/basics_for_infrared_detection/dataset/LSOTB-TIR_TrainingData_part5/TIR_training_004/TIR_training_004_ann/'
    G_ann = dir(folder_ann);  %dir for folder_ann type string
    G_ann = G([G.isdir]); 
    G_ann = G_ann(~ismember({G_ann.name}, {'.' '..'}));          % out: G_ann.name :string      


    G_ann(strncmp({G_ann.name}, '.',1)) = [];  % Remove . and ..

    G_ann= rmfield(G_ann,{'date','bytes', 'isdir', 'datenum'}); %G_ann  Matlab  struct of string
% G_ann=Airplaine_002, bear_001, etc
    for k = 1:length(G_ann)
        %subfolder_ann = uigetdir('folder_ann','Select Input-subfolder-annotations'); 
        f_ann = fullfile(folder_ann, G_ann(k).name); %subfolder_ann=f_ann    %f_ann string path to airplane for instance
        
        %movefile(sprintf('%s',f_ann ,'\*.xml'),sprintf('%s',f_ann ,'\', sprintf('part_5_train_%d_',j),G_ann(1).name,'_',  '\*.xml' ) )
        
        F_ann = dir(sprintf('%s/*.xml', f_ann));   %name of *.xml is not string %dir come out with Matlab struct%out: F_ann.name:string
        %F= rmfield(F_ann,{'date','bytes', 'isdir', 'datenum'});
        %%[filenames, pathname] = uigetfile({sprintf('%s/*.xml', f_ann)}, 'MultiSelect', 'on', 'Please select the images');  
        %   mkdir mycurrentfiles  
        %attention here,after rename xml file, remove these lines:
        for h = 1:length(F_ann)
            movefile(sprintf('%s',f_ann ,'\',F_ann(h).name),sprintf('%s',f_ann ,'\', sprintf('part_5_train_%d_',j),G_ann(k).name,'_', F_ann(h).name) )
        end
