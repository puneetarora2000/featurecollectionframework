clc;
close all;
clear all;




  featuredatabase = 'colorfeatures.txt';
  ResultDir = 'D:\CompleteProgramForDataCollecttion\ColorDefect3\images\';
  dirpath = ResultDir; 
  dirInfo = dir(dirpath);
  isDir = [dirInfo.isdir];
  LetterFiles = {dirInfo(~isDir).name};
  fid = fopen(featuredatabase,'a');  

for i=1:numel(LetterFiles)-1 
 
    fullPath = strcat(ResultDir,LetterFiles(i)); 
    colors =   ExtractColorFeatures(char(fullPath));
    % Values 
   MeanR =  colors.MeanR ; % Mean of Red 
   MeanG =  colors.MeanG  ; % Mean of Green 
   MeanB  = colors.MeanB ; % Mean of Blue

   MeanH =  colors.MeanH ; % Mean of Red 
   MeanS =  colors.MeanS  ; % Mean of Green 
   MeanV  = colors.MeanV ; % Mean of Blue

   
   Meany  = colors.Meany  ; % Mean of Cyan
   Meancb = colors.Meancb ; % Mean of Magenta 
   Meancr = colors.Meancr ; % Mean of Yellow


    
 Miny =  colors.Miny; % Max of Cyan
 Mincb = colors.Mincb; % Max of Magenta 
 Mincr = colors.Mincr; % Max of Yellow


 MinR =  colors.Miny; % Max of Cyan
 MinG = colors.Mincb; % Max of Magenta 
 MinB = colors.Mincr; % Max of Yellow


 MinH =  colors.Miny; % Max of Cyan
 MinS = colors.Mincb; % Max of Magenta 
 MinV = colors.Mincr; % Max of Yellow


   
  Maxy =  colors.Maxy; % Max of Cyan
  Maxcb = colors.Maxcb; % Max of Magenta 
  Maxcr = colors.Maxcr; % Max of Yellow


 MaxR =  colors.Maxy; % Max of Cyan
 MaxG = colors.Maxcb; % Max of Magenta 
 MaxB = colors.Maxcr; % Max of Yellow


 MaxH =  colors.Maxy; % Max of Cyan
 MaxS = colors.Maxcb; % Max of Magenta 
 MaxV = colors.Maxcr; % Max of Yellow

 
%%%%%%%%%%%%
 
 fprintf(fid,'\n %d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,  %d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d',MaxR,MinR,MaxG,MinG,MaxB,MinB,  MaxH,MinS,MaxV,MinH,MaxS,MinV,  Maxy,Miny,Maxcb,Mincb,Maxcr,Mincr,Maxy,Miny,Maxcb,Mincb,Maxcr,Mincr,   MeanR,MeanG,MeanB,MeanH,MeanS,MeanV,Meany,Meancr,Meancb);
 
 
 
end

load colorfeatures.txt;
save colorfeatures.mat colorfeatures
close('all')
