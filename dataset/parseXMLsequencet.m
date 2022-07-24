function theStruct = parseXMLsequence(filename)
% PARSEXML Convert XML file to a MATLAB structure.
try
   tree = xmlread(filename);
catch
   error('Failed to read XML file %s.',filename);
end

% Recurse over child nodes. This could run into problems 
% with very deeply nested trees.
try
   theStruct = parseChildNodes(tree);
catch
   error('Unable to parse XML file %s.',filename);
end


% ----- Local function PARSECHILDNODES -----
function children = parseChildNodes(theNode)
% Recurse over node children.
children = [];
if theNode.hasChildNodes
   childNodes = theNode.getChildNodes;
   numChildNodes = childNodes.getLength;
   allocCell = cell(1, numChildNodes);

   children = struct(             ...
      'Name', allocCell, 'Attributes', allocCell,    ...
      'Data', allocCell, 'Children', allocCell);

    for count = 1:numChildNodes
        theChild = childNodes.item(count-1);
        children(count) = makeStructFromNode(theChild);
    end
end

% ----- Local function MAKESTRUCTFROMNODE -----
function nodeStruct = makeStructFromNode(theNode)
% Create structure of node info.

nodeStruct = struct(                        ...
   'Name', char(theNode.getNodeName),       ...
   'Attributes', parseAttributes(theNode),  ...
   'Data', '',                              ...
   'Children', parseChildNodes(theNode));

if any(strcmp(methods(theNode), 'getData'))
   nodeStruct.Data = char(theNode.getData); 
else
   nodeStruct.Data = '';
end

% ----- Local function PARSEATTRIBUTES -----
function attributes = parseAttributes(theNode)
% Create attributes structure.

attributes = [];
if theNode.hasAttributes
   theAttributes = theNode.getAttributes;
   numAttributes = theAttributes.getLength;
   allocCell = cell(1, numAttributes);
   attributes = struct('Name', allocCell, 'Value', ...
                       allocCell);

   for count = 1:numAttributes
      attrib = theAttributes.item(count-1);
      attributes(count).Name = char(attrib.getName);
      attributes(count).Value = char(attrib.getValue);
   end
end



%commands in Command Window:
%sampleXMLfile = '00000001.xml';
%mlStruct = parseXMLsequence(sampleXMLfile);
     
% phases = {'00000001.xml', '00000002.xml'};
% F = dir('H:\video to apply SSL\testdeux/*.xml')
% F(i).name
% event_listsequence={};     
% for i=1:length(phases)
% for i=1:length(F)
%        sampleXMLfile = phases{i};
%        sampleXMLfile = F(i).name;
%        mlStruct = parseXMLsequence(sampleXMLfile);
%        mlStruct.Children(1) = [];
%        mlStruct.Children(2) = [];
%        mlStruct.Children(3) = [];
%        mlStruct.Children(4) = [];
%        mlStruct.Children(5) = [];
%        mlStruct.Children(6) = [];
%        mlStruct.Children = rmfield(mlStruct.Children, {'Attributes', 'Data'});
%        mlStruct.Children(1).Children = rmfield(mlStruct.Children(1).Children, {'Name', 'Attributes', 'Children'} );
%        mlStruct.Children(2).Children = rmfield(mlStruct.Children(2).Children, {'Name', 'Attributes', 'Children'} );
%        mlStruct.Children(3).Children(1) = [];
%        mlStruct.Children(3).Children(2) = [];
%        mlStruct.Children(3).Children  = rmfield(mlStruct.Children(3).Children , {'Attributes', 'Data'} );
%        mlStruct.Children(3).Children.Children = rmfield(mlStruct.Children(3).Children.Children, {'Name', 'Attributes', 'Children'} );
%        mlStruct.Children(4).Children(1) = [];
%        mlStruct.Children(4).Children(2) = [];
%        mlStruct.Children(4).Children(3) = [];
%        mlStruct.Children(4).Children  = rmfield(mlStruct.Children(4).Children  , {'Attributes', 'Data'} );
%        mlStruct.Children(4).Children(1).Children = rmfield(mlStruct.Children(4).Children(1).Children, {'Name', 'Attributes', 'Children'} );
%        mlStruct.Children(4).Children(2).Children = rmfield(mlStruct.Children(4).Children(2).Children, {'Name', 'Attributes', 'Children'} );
%        mlStruct.Children(5).Children(1) = [];
%        mlStruct.Children(5).Children(2) = [];
%        mlStruct.Children(5).Children(3) = [];
%        mlStruct.Children(5).Children(4) = [];
%        mlStruct.Children(5).Children(5) = [];
%        mlStruct.Children(5).Children    = rmfield(mlStruct.Children(5).Children  , {'Attributes', 'Data'} );
%        mlStruct.Children(5).Children(1).Children = rmfield(mlStruct.Children(5).Children(1).Children, {'Name', 'Attributes', 'Children'} );
%        mlStruct.Children(5).Children(2).Children = rmfield(mlStruct.Children(5).Children(2).Children, {'Name', 'Attributes', 'Children'} );
%        mlStruct.Children(5).Children(3).Children = rmfield(mlStruct.Children(5).Children(3).Children, {'Name', 'Attributes', 'Children'} );
%        mlStruct.Children(5).Children(4).Children(1) = [];
%        mlStruct.Children(5).Children(4).Children(2) = [];
%        mlStruct.Children(5).Children(4).Children(3) = [];
%        mlStruct.Children(5).Children(4).Children(4) = [];
%        mlStruct.Children(5).Children(4).Children(5) = [];
%        mlStruct.Children(5).Children(4).Children    = rmfield(mlStruct.Children(5).Children(4).Children  , {'Attributes', 'Data'} );
%        mlStruct.Children(5).Children(4).Children(1).Children = rmfield(mlStruct.Children(5).Children(4).Children(1).Children, {'Name', 'Attributes', 'Children'} );
%        mlStruct.Children(5).Children(4).Children(2).Children = rmfield(mlStruct.Children(5).Children(4).Children(2).Children, {'Name', 'Attributes', 'Children'} );
%        mlStruct.Children(5).Children(4).Children(3).Children = rmfield(mlStruct.Children(5).Children(4).Children(3).Children, {'Name', 'Attributes', 'Children'} );
%        mlStruct.Children(5).Children(4).Children(4).Children = rmfield(mlStruct.Children(5).Children(4).Children(4).Children, {'Name', 'Attributes', 'Children'} );
%        mlStruct   = rmfield(mlStruct  , {'Attributes', 'Data'} );  

%        newField = 'event_list';
%        [mlStruct.Children(1).Children.(newField)] = mlStruct.Children(1).Children.('Data');
%        mlStruct.Children(1).Children = rmfield(mlStruct.Children(1).Children,'Data');
%        disp(mlStruct.Children(1).Children);

%        newField = 'file_list';
%        [mlStruct.Children(2).Children.(newField)] = mlStruct.Children(2).Children.('Data');
%        mlStruct.Children(2).Children = rmfield(mlStruct.Children(2).Children,'Data');
%        disp(mlStruct.Children(2).Children);

%        event_listsequence{i, 1} = mlStruct.Children(1).Children.event_list; 
%        mlStruct.Children(1).Children  = rmfield(mlStruct.Children(1).Children,'event_list');
%        disp(mlStruct.Children(1).Children);

%        file_listsequence{i, 1} = mlStruct.Children(2).Children.file_list; 
%        mlStruct.Children(1).Children  = rmfield(mlStruct.Children(2).Children,'file_list');
%        disp(mlStruct.Children(2).Children);
% 
% end
     
    % To remove matlab structure






%['TIR_training_003/airplane_006']

%LSOTB_part5/TIR_training_003/airplane_006

% LSOTB_part1_TIRDataset
% LSOTB_part2_TIRDataset
% LSOTB_part3_TIRDataset
% LSOTB_part4_TIRDataset
% LSOTB_part5_TIRDataset
% sprintf('LSOTB_{%s}', 'part1')

              %%bndbox to face_bbx_list
% face_bbx_list_test{1, 1}={mlStruct.Children(5).Children(4).Children(1).Children.Data,    mlStruct.Children(5).Children(4).Children(2).Children.Data,   mlStruct.Children(5).Children(4).Children(3).Children.Data,    mlStruct.Children(5).Children(4).Children(4).Children.Data}
%pour retourner  la ligne in a cell {; ; ;}
% list  of an  airplane event for example : face_bbx_list{1, 1}  
% face_bbx_list{1, 1}{1, 1}: first image from the first event
% face_bbx_list{1, 1}{2, 1}: second image from the first event
% face_bbx_list_unique_image{1, 1}={mlStruct.Children(5).Children(4).Children(1).Children.Data,    mlStruct.Children(5).Children(4).Children(2).Children.Data,   mlStruct.Children(5).Children(4).Children(3).Children.Data,    mlStruct.Children(5).Children(4).Children(4).Children.Data}
% face_bbx_list_unique_image{2, 1}={mlStruct.Children(5).Children(4).Children(1).Children.Data,    mlStruct.Children(5).Children(4).Children(2).Children.Data,   mlStruct.Children(5).Children(4).Children(3).Children.Data,    mlStruct.Children(5).Children(4).Children(4).Children.Data}
% for unique image, we can find multiple bbox


     %% occluded to occlusion_label_list
% occlusion_label_list{1, 1}: list of first event   
%  occlusion_label_list{1, 1}{1, 1}: an image(can contain multiple box) in  the first event  
% occlusion_label_list{1, 1}{2, 1}: second image in first event  

% occlusion_label_list_test{1, 1}= mlStruct.Children(5).Children(3).Children.Data
%% trackid to pose_label_list  % to expression_label_list
%% Naan to illumination_label_list
% Naan to blur_label_list
% track_label_list_test{1, 1}= mlStruct.Children(5).Children(2).Children.Data


  %C = struct2cell(S) converts a structure into a cell array. The cell array C contains values copied from the fields of S.

   %The struct2cell function does not return field names. To return the field names in a cell array, use the fieldnames function. 
 
   % struct2cell(struct2cell(mlStruct){2, 1})
   
   %C = struct2cell(mlStruct) 
   % C_2= struct2cell(C{2, 1})
   
  
  
   
% newField = 'file_list';
% [a.(newField)] = a.('Data');
% a = rmfield(a,oldField);
% disp(a)



 
 

