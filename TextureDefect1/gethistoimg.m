function [ histoValues  diagonalImage histoValues dupperImage histoValues dlowerImage] = gethistoimg( img )
 
 histoValues = imhist(img,2);
 diagonalImage = imhist(diag(img,2)); 
 histoValues = imhist(img,2);
 dupperImage = imhist(triu(img),2);
 histoValues = imhist(img,2);
 dlowerImage = imhist(tril(img),2);
 


end

