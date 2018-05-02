image=imread('D:\crproject\crimages\11.png');
figure(1)
imshow(image);
title('INPUT IMAGE WITH NOISE')
if size(image,3)==3 
    image=rgb2gray(image);
end
level = graythresh(image);
image =im2bw(image,level);
image = bwareaopen(image,30);
pause(1)
figure(2)
imshow(image);
title('INPUT IMAGE WITHOUT NOISE')
[L Ne]=bwlabel(image);
propied=regionprops(L,'BoundingBox');
hold on
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off
pause (1)
figure
for n=1:Ne
    [r,c] = find(L==n);
    n1=image(min(r):max(r),min(c):max(c));
    imshow(~n1);
    pause(0.5)
end