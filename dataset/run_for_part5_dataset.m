
%first step: add all folders and subfolders and scripts to path by double
%clic and choose add to path

#for j =1: 4
    %folder_ann = uigetdir('H:\video_to_apply_SSL\LSOTB-TIR_TrainingData\test_sur_four_lstob\','Select Input-folder-annotations'); 
    %folder_ann = uigetdir('D:\Matlab C\TLBO\test_sur_four_lstob' ,'Select Input-folder-annotations');
    #folder_ann = uigetdir('\content\gdrive\MyDrive\Colab Notebooks\first trial\basics_for_infrared_detection\dataset\LSOTB-TIR_TrainingData\Annotations\' ,'Select Input-folder');
    %choice between TIR_training_001, TIR_training_002, TIR_training_003,etc.
    %folder_ann= H:\video_to_apply_SSL\LSOTB-TIR_TrainingData\Annotations\test_sur_four_lstob\TIR_training_001
         % in workspace (type: string)
         
         
    folder_ann = '/content/gdrive/MyDrive/Colab Notebooks/first trial/basics_for_infrared_detection/dataset/LSOTB-TIR_TrainingData_part5/TIR_training_004/TIR_training_004_ann\'
    G_ann = dir(folder_ann);  %dir for folder_ann type string
    G_ann = G_ann([G_ann.isdir]); 
    G_ann = G_ann(~ismember({G_ann.name}, {'.' '..'}));          % out: G_ann.name :string      


    G_ann(strncmp({G_ann.name}, '.',1)) = [];  % Remove . and ..

    G_ann= rmfield(G_ann,{'date','bytes', 'isdir', 'datenum'}); %G_ann  Matlab  struct of string
% G_ann=Airplaine_002, bear_001, etc
    for k = 1:length(G_ann)
        f_ann = fullfile(folder_ann, G_ann(k).name); %subfolder_ann=f_ann    %f_ann string path to airplane for instance
        F_ann = dir(sprintf('%s/*.xml', f_ann));
        
        event_listsequence = {}; 
        file_listsequence = {};
        lsotb_bbx_list_sequence = {};
        occlusion_label_list_sequence = {};
        track_label_list_sequence = {};
     
        for i = 1:length(F_ann)
             
            mlStruct = []; 
            mlStruct = parseXMLsequencet(fullfile ( f_ann,F_ann(i).name));
            mlStruct.Children(1) = [];
            mlStruct.Children(2) = [];
            mlStruct.Children(3) = [];
            mlStruct.Children(4) = [];
            mlStruct.Children(5) = [];
            mlStruct.Children(6) = [];
            mlStruct.Children = rmfield(mlStruct.Children, {'Attributes', 'Data'});
            mlStruct.Children(1).Children = rmfield(mlStruct.Children(1).Children, {'Name', 'Attributes', 'Children'} );
            mlStruct.Children(2).Children = rmfield(mlStruct.Children(2).Children, {'Name', 'Attributes', 'Children'} );
            mlStruct.Children(3).Children(1) = [];
            mlStruct.Children(3).Children(2) = [];
            mlStruct.Children(3).Children  = rmfield(mlStruct.Children(3).Children , {'Attributes', 'Data'} );
            mlStruct.Children(3).Children.Children = rmfield(mlStruct.Children(3).Children.Children, {'Name', 'Attributes', 'Children'} );
            mlStruct.Children(4).Children(1) = [];
            mlStruct.Children(4).Children(2) = [];
            mlStruct.Children(4).Children(3) = [];
            mlStruct.Children(4).Children  = rmfield(mlStruct.Children(4).Children  , {'Attributes', 'Data'} );
            mlStruct.Children(4).Children(1).Children = rmfield(mlStruct.Children(4).Children(1).Children, {'Name', 'Attributes', 'Children'} );
            mlStruct.Children(4).Children(2).Children = rmfield(mlStruct.Children(4).Children(2).Children, {'Name', 'Attributes', 'Children'} );
            mlStruct.Children(5).Children(1) = [];
            mlStruct.Children(5).Children(2) = [];
            mlStruct.Children(5).Children(3) = [];
            mlStruct.Children(5).Children(4) = [];
            mlStruct.Children(5).Children(5) = [];
            mlStruct.Children(5).Children    = rmfield(mlStruct.Children(5).Children  , {'Attributes', 'Data'} );
            mlStruct.Children(5).Children(1).Children = rmfield(mlStruct.Children(5).Children(1).Children, {'Name', 'Attributes', 'Children'} );
            mlStruct.Children(5).Children(2).Children = rmfield(mlStruct.Children(5).Children(2).Children, {'Name', 'Attributes', 'Children'} );
            mlStruct.Children(5).Children(3).Children = rmfield(mlStruct.Children(5).Children(3).Children, {'Name', 'Attributes', 'Children'} );
            mlStruct.Children(5).Children(4).Children(1) = [];
            mlStruct.Children(5).Children(4).Children(2) = [];
            mlStruct.Children(5).Children(4).Children(3) = [];
            mlStruct.Children(5).Children(4).Children(4) = [];
            mlStruct.Children(5).Children(4).Children(5) = [];
            mlStruct.Children(5).Children(4).Children    = rmfield(mlStruct.Children(5).Children(4).Children  , {'Attributes', 'Data'} );
            mlStruct.Children(5).Children(4).Children(1).Children = rmfield(mlStruct.Children(5).Children(4).Children(1).Children, {'Name', 'Attributes', 'Children'} );
            mlStruct.Children(5).Children(4).Children(2).Children = rmfield(mlStruct.Children(5).Children(4).Children(2).Children, {'Name', 'Attributes', 'Children'} );
            mlStruct.Children(5).Children(4).Children(3).Children = rmfield(mlStruct.Children(5).Children(4).Children(3).Children, {'Name', 'Attributes', 'Children'} );
            mlStruct.Children(5).Children(4).Children(4).Children = rmfield(mlStruct.Children(5).Children(4).Children(4).Children, {'Name', 'Attributes', 'Children'} );
            mlStruct   = rmfield(mlStruct  , {'Attributes', 'Data'} );  

            newField = 'event_list';
            [mlStruct.Children(1).Children.(newField)] = mlStruct.Children(1).Children.('Data');
            mlStruct.Children(1).Children = rmfield(mlStruct.Children(1).Children,'Data');
            disp(mlStruct.Children(1).Children);

            newField = 'file_list';
            [mlStruct.Children(2).Children.(newField)] = mlStruct.Children(2).Children.('Data');
            mlStruct.Children(2).Children = rmfield(mlStruct.Children(2).Children,'Data');
            %inside the xml, labeling is not done
           
            disp(sprintf('part_5_train_%d_%s_%s', j, G_ann(k).name, mlStruct.Children(2).Children.file_list));
            event_listsequence{i, 1} = mlStruct.Children(1).Children.event_list; 
              
           file_listsequence{i, 1} = sprintf('part_5_train_%d_%s_%s', j, G_ann(k).name, mlStruct.Children(2).Children.file_list);


            lsotb_bbx_list_sequence{i, 1}={mlStruct.Children(5).Children(4).Children(1).Children.Data,    mlStruct.Children(5).Children(4).Children(2).Children.Data,   mlStruct.Children(5).Children(4).Children(3).Children.Data,    mlStruct.Children(5).Children(4).Children(4).Children.Data};
         
            occlusion_label_list_sequence{i, 1} = mlStruct.Children(5).Children(3).Children.Data; 
            track_label_list_sequence{i, 1} =  mlStruct.Children(5).Children(2).Children.Data;
              
            mlStruct = []; 

        end
       
        %rmdir mycurrentfiles
    
        file_list_train1_part5{k,1} = file_listsequence;  
        lsotb_bbx_list_train1_part5{k,1} = lsotb_bbx_list_sequence; 
        occlusion_label_list_train1_part5{k,1} = occlusion_label_list_sequence;
        track_label_list__train1_part5{k,1} = track_label_list_sequence;
        event_list_train1_part5{k,1} = event_listsequence{1,1};  %%%%%

    end
    
    Mat_part5_train_4.event_list{1,1} = event_list_train1_part5;
    Mat_part5_train_4.file_list{1,1} = file_list_train1_part5;
    Mat_part5_train_4.bbx_list{1,1} = lsotb_bbx_list_train1_part5;
    Mat_part5_train_4.occlusion_label_list{1,1}= occlusion_label_list_train1_part5;
    Mat_part5_train_4.track_label_list{1,1} = track_label_list_sequence;


%end



% Mat_LSTOB.file_list{1,1} =  Mat_all_part5.file_list;
% Mat_LSTOB.event_list{1,1} =  Mat_all_part5.event_list;
% Mat_LSTOB.bbx_list{1, 1} = Mat_all_part5.bbx_list;
% Mat_LSTOB.occlusion_label_list = Mat_all_part5.occlusion_label_list;
% Mat_LSTOB.track_label_list = Mat_all_part5.track_label_list;

%matlab.io.saveVariablesToScript('Save_LSOTB_annotation.m', {'Mat_all_part5','Mat_LSTOB'} )
matlab.io.saveVariablesToScript('Save_LSOTB_annotation_part_5_training_4.m', {'Mat_part5_train_4'} )
