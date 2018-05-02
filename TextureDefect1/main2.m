clc;
close all;
clear all;
 

 

  ResultDir = 'D:\CompleteProgramForDataCollecttion\TextureDefect1\images\';
  dirpath = ResultDir; 
  dirInfo = dir(dirpath);
  isDir = [dirInfo.isdir];
  LetterFiles = {dirInfo(~isDir).name};


for i=1:numel(LetterFiles)-1
    
fullPath = strcat(ResultDir,LetterFiles(i)); 
status  = ExtractFeatures(char(fullPath));
end 