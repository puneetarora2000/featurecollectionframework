clc;
close all;
clear all;
 

 

  ResultDir = 'D:\CompleteProgramForDataCollecttion\TextureDefect1_3\images\';
  dirpath = ResultDir; 
  dirInfo = dir(dirpath);
  isDir = [dirInfo.isdir];
  LetterFiles = {dirInfo(~isDir).name};


for i=1:numel(LetterFiles)-1
    i
fullPath = strcat(ResultDir,LetterFiles(i)) 
status  = ExtractFeatures(char(fullPath));
end 