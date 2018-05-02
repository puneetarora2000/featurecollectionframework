function colors  = ExtractColorFeatures(filename)

 I = imread(filename);
  
  R = double(I(:,:,1));
  G = double(I(:,:,2));
  B = double(I(:,:,3));

  

% color features extractions 
colors.MeanR = mean(mean(R)) ; % Mean of Red 
colors.MeanG = mean(mean(G)) ; % Mean of Green 
colors.MeanB = mean(mean(B)); % Mean of Blue


colors.MaxR = max(max(R)); % Max of Red 
colors.MaxG = max(max(G)); % Max of Green 
colors.MaxB = max(max(B)); % Max of Blue


colors.MinR = min(min(R)); % Min of Red 
colors.MinG = min(min(G)); % Min of Green 
colors.MinB = min(min(B)); % Min of Blue

hsvI =         rgb2hsv(I);

  H = double(hsvI(:,:,3));
  S = double(hsvI(:,:,2));
  V = double(hsvI(:,:,1));


colors.MeanH =  mean(mean(H)); % Mean of Hue
colors.MeanS = mean(mean(S)); % Mean of Saturation 
colors.MeanV = mean(mean(V)); % Mean of Intensity 

colors.MaxH = max(max(H)); % Max of Hue
colors.MaxS = max(max(S)); % Max of Saturation 
colors.MaxI = max(max(V)); % Max of Intensity


colors.MinH = min(min(H)); % Min of Hue 
colors.MinS = min(min(S)); % Min of Saturation 
colors.MinI = min(min(V)); % Min of Intensity

Iycbcr = rgb2ycbcr(I);
 
  y = double(Iycbcr(:,:,3));
  cb = double(Iycbcr(:,:,2));
  cr = double(Iycbcr(:,:,1));



colors.Meany = mean(mean(y)); % Mean of Cyan
colors.Meancb = mean(mean(cb)); % Mean of Magenta 
colors.Meancr = mean(mean(cr)); % Mean of Yellow
 
colors.Maxy = max(max(y)); % Max of Cyan
colors.Maxcb = max(max(cb)); % Max of Magenta 
colors.Maxcr = max(max(cr)); % Max of Yellow


colors.Miny = min(min(y)); % Min of Cyan
colors.Mincb = min(min(cb)); % Min of Magenta 
colors.Mincr = min(min(cr)); % Min of Yellow




end 