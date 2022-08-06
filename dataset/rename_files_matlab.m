
    folder_ann = '/content/gdrive/MyDrive/Colab Notebooks/first trial/basics_for_infrared_detection/dataset/LSOTB-TIR_TrainingData_part5/TIR_training_004/TIR_training_004_ann/'
    G_ann = dir(folder_ann);  
    G_ann = G([G.isdir]); 
    G_ann = G_ann(~ismember({G_ann.name}, {'.' '..'}));              
    G_ann(strncmp({G_ann.name}, '.',1)) = [];  
    G_ann= rmfield(G_ann,{'date','bytes', 'isdir', 'datenum'}); 
    
    
    for k = 1:length(G_ann)
        f_ann = fullfile(folder_ann, G_ann(k).name); 
        F_ann = dir(sprintf('%s/*.xml', f_ann));   
        for h = 1:length(F_ann)
            movefile(sprintf('%s',f_ann ,'\',F_ann(h).name),sprintf('%s',f_ann ,'\', sprintf('part_5_train_%d_',4),G_ann(k).name,'_', F_ann(h).name) )
        end
    end      
