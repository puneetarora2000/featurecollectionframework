function [status ]= ExtractFeatures(fullPath)
txtfeatures = 'txtfeatures.txt';
fid1 = fopen (txtfeatures,'a');
image=imread(fullPath);
if size(image,3)==3 
    image=rgb2gray(image);
end
level = graythresh(image);
image =~im2bw(image,level);
image = bwareaopen(image,25);
[L Ne]=bwlabel(image);
propied=regionprops(L,'BoundingBox');
hold on
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','r','LineWidth',2)
end
hold off

for n=1:Ne
    [r,c] = find(L==n);
    n1=image(min(r):max(r),min(c):max(c));
    n1 = double(n1);
    
    glcm2 = graycomatrix(n1,'Offset',[0 2]); 
    out = cad_glcm_features(glcm2);
autoc=  out.autoc ;  % Autocorrelation: [2]
contr= out.contr  ; % Contrast: matlab/[1,2]
corrm= out.corrm ; % Correlation: matlab
corrp = out.corrp ; % Correlation: [1,2]
cprom= out.cprom ; % Cluster Prominence: [2]
cshad= out.cshad ; % Cluster Shade: [2]
dissi= out.dissi ; % Dissimilarity: [2]
energ= out.energ ; % Energy: matlab / [1,2]
entro= out.entro ; % Entropy: [2]
homom= out.homom ; % Homogeneity: matlab
homop = out.homop ; % Homogeneity: [2]
maxpr= out.maxpr ; % Maximum probability: [2]
sosvh = out.sosvh ; % Sum of sqaures: Variance [1]
savgh= out.savgh ; % Sum average [1]
svarh= out.svarh ; % Sum variance [1]
senth= out.senth ; % Sum entropy [1]
dvarh =out.dvarh ; % Difference variance [4]
denth = out.denth ; % Difference entropy [1]
inf1h= out.inf1h ; % Information measure of correlation1 [1]
inf2h= out.inf2h ; % Informaiton measure of correlation2 [1]
indnc = out.indnc ; % Inverse difference normalized (INN) [3]
idmnc = out.idmnc ; % Inverse difference moment normalized [3]


    
    fprintf(fid1,'\n %d %6f,%6f,%6f,%6f,%6f,%6f,%6f,%6f ,%6f,%6f,%6f,%6f,%6f,%6f,%6f,%6f,%6f,%6f,%6f,%6f,%6f,%6f',n,autoc,contr,corrm,corrp,cprom,cshad,dissi,energ,entro,homom,homop,maxpr,sosvh,savgh,svarh,senth,dvarh,denth,inf1h,inf2h,indnc,idmnc );
    
        
end
load 'txtfeatures.txt';
save 'txtfeatures.mat' txtfeatures 
status =  fclose('all');
disp('Thanks')

end 