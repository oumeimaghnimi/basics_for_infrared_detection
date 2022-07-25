
%first step: add all folders and subfolders and scripts to path by double
%clic and choose add to path

for j =1: 4
    %folder_ann = uigetdir('H:\video_to_apply_SSL\LSOTB-TIR_TrainingData\test_sur_four_lstob\','Select Input-folder-annotations'); 
    %folder_ann = uigetdir('D:\Matlab C\TLBO\test_sur_four_lstob' ,'Select Input-folder-annotations');
    folder_ann = uigetdir('\content\gdrive\MyDrive\Colab Notebooks\first trial\basics_for_infrared_detection\dataset\LSOTB-TIR_TrainingData\Annotations\' ,'Select Input-folder');
    %choice between TIR_training_001, TIR_training_002, TIR_training_003,etc.
    %folder_ann= H:\video_to_apply_SSL\LSOTB-TIR_TrainingData\Annotations\test_sur_four_lstob\TIR_training_001
         % in workspace (type: string)
   
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
        
        F_ann = dir(sprintf('%s/*.xml', f_ann));
        %  movefile('H:\video to apply SSL\LSOTB-TIR_TrainingData\Annotations\TIR_training_003\Drone_boat_001\00000001test.xml','H:\video to apply SSL\LSOTB-TIR_TrainingData\Annotations\TIR_training_003\Drone_boat_001\00000001.xml'); 
        event_listsequence = {}; 
        file_listsequence = {};
        lsotb_bbx_list_sequence = {};
        occlusion_label_list_sequence = {};
        track_label_list_sequence = {};
      %select all by click 
     %%[filenames, pathname] = uigetfile( {sprintf('%s/*.xml', f_ann)}, 'MultiSelect', 'on', 'Please select the images');
     %appliquer one function to each cell in  cell array
     %%fullFilenames = cellfun( @(x) fullfile( pathname, x ), filenames, 'UniformOutput', false );
     %%fullparseFilenames = cellfun( @(x) parseXMLsequencet( x), fullFilenames, 'UniformOutput', false );
        %for i = 1:length(mycurrentfiles)
        for i = 1:length(F_ann)
             %sampleXMLfile = F_ann(i).name;
            mlStruct = []; 
            %load(F_ann(i).name);
            % rename
            %mlStruct = parseXMLsequencet(mycurrentfiles(i).name);
            % essayer de modofier the nom of file in the matlab structure
            % and in parallel the file names.
            %sprintf('%s/',  f_ann, F_ann(1).name ) :H:\video to apply SSL\LSOTB-TIR_TrainingData\Annotations\TIR_training_003\Drone_boat_001/00000001test.xml/
            % movefile( sprintf('%s/00000001.xml', f_ann), sprintf('%s/mimi.xml', f_ann ));
            % movefile( sprintf('%s/',f_ann, F_ann(i).name  ), sprintf('%s/00000001.xml', f_ann));
            %movefile( sprintf('%s/',f_ann, 'mimi.xml'  ), sprintf('%s/00000001.xml', f_ann));
            %movefile( sprintf('00000001.xml'), sprintf('part_5_train_%s_airplane_00000001.xml', '1'));
                %sprintf('%s',f_ann ,'\',F_ann(1).name)
       %H:\video_to_apply_SSL\LSOTB-TIR_TrainingData\test_sur_four_lstob\TIR_training_001\airplane_002\00000001.xml
                %sprintf('%s',f_ann ,'\', sprintf('part_5_train_%d_',j),G_ann(1).name,'_', F_ann(1).name) 
        % H:\video_to_apply_SSL\LSOTB-TIR_TrainingData\test_sur_four_lstob\TIR_training_001\airplane_002\part_5_train_1_airplane_002_00000001.xml
           %movefile(sprintf('%s',f_ann ,'\',F_ann(1).name),sprintf('%s',f_ann ,'\', sprintf('part_5_train_%d_',j),G_ann(1).name,'_', F_ann(1).name) )
          
            % name of file: part_5_train_1_airplane_002_00000001
           
            
            
            % 0_Parade_marchingband_1_737.jpg
            %('train_{%s}_',G_ann(%s).name,j,k)
            %mlStruct = parseXMLsequencet(F_ann(i).name);
            mlStruct = parseXMLsequencet(fullfile ( f_ann,F_ann(i).name));
            %Function = @(x) parseXMLsequencet(x );
            %mlStruct = Function(F_ann(i).name);
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
            %disp(mlStruct.Children(2).Children);
            disp(sprintf('part_5_train_%d_%s_%s', j, G_ann(k).name, mlStruct.Children(2).Children.file_list));
            event_listsequence{i, 1} = mlStruct.Children(1).Children.event_list; 
                %event_listsequence{1, 1} = mlStruct.Children(1).Children.event_list;
                %mlStruct.Children(1).Children  = rmfield(mlStruct.Children(1).Children,'event_list');
                %disp(mlStruct.Children(1).Children);

           % file_listsequence{i, 1} = mlStruct.Children(2).Children.file_list; 
           file_listsequence{i, 1} = sprintf('part_5_train_%d_%s_%s', j, G_ann(k).name, mlStruct.Children(2).Children.file_list);
            %%file_listsequence{i, 1}= sprintf( sprintf('part_5_train_%d_',1),G_ann(1).name,'_', mlStruct.Children(2).Children.file_list) 
              %mlStruct.Children(1).Children  = rmfield(mlStruct.Children(2).Children,'file_list');
              %disp(mlStruct.Children(2).Children);
       
           %movefile( sprintf('file_listsequence{i, 1}'), sprintf('part_5_train_%s_G_ann(k).name_file_listsequence{i, 1}', 'j'));
    
                     %%bndbox to lsotb_bbx_list

            lsotb_bbx_list_sequence{i, 1}={mlStruct.Children(5).Children(4).Children(1).Children.Data,    mlStruct.Children(5).Children(4).Children(2).Children.Data,   mlStruct.Children(5).Children(4).Children(3).Children.Data,    mlStruct.Children(5).Children(4).Children(4).Children.Data};
            %to make it in form of x,y, w,h
            %lsotb_bbx_list_sequence{i,1}={
%(str2num(mlStruct.Children(5).Children(4).Children(1).Children.Data) + (str2num(mlStruct.Children(5).Children(4).Children(3).Children.Data) -  str2num(mlStruct.Children(5).Children(4).Children(1).Children.Data))/2) , 
%(str2num(mlStruct.Children(5).Children(4).Children(2).Children.Data) + (str2num(mlStruct.Children(5).Children(4).Children(4).Children.Data) - str2num(mlStruct.Children(5).Children(4).Children(2).Children.Data))/2), 
%(str2num(mlStruct.Children(5).Children(4).Children(3).Children.Data) -  str2num(mlStruct.Children(5).Children(4).Children(1).Children.Data)) ,
%(str2num(mlStruct.Children(5).Children(4).Children(4).Children.Data) - str2num(mlStruct.Children(5).Children(4).Children(2).Children.Data))}

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
    
    Mat_all_part5.event_list{j,1} = event_list_train1_part5;
    Mat_all_part5.file_list{j,1} = file_list_train1_part5;
    Mat_all_part5.bbx_list{j,1} = lsotb_bbx_list_train1_part5;
    Mat_all_part5.occlusion_label_list{j,1}= occlusion_label_list_train1_part5;
    Mat_all_part5.track_label_list{j,1} = track_label_list_sequence;


end
% Mat_LSTOB.file_list{1,1} =  Mat_all_part5.file_list;
% Mat_LSTOB.event_list{1,1} =  Mat_all_part5.event_list;
% Mat_LSTOB.bbx_list{1, 1} = Mat_all_part5.bbx_list;
% Mat_LSTOB.occlusion_label_list = Mat_all_part5.occlusion_label_list;
% Mat_LSTOB.track_label_list = Mat_all_part5.track_label_list;

matlab.io.saveVariablesToScript('Save_LSOTB_annotation.m', {'Mat_all_part5','Mat_LSTOB'} )
