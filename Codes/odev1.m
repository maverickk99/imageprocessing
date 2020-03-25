%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%	1)Bit PLane	%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;clc;clf;

[X]=imread('odev1.jpg');

subplot(3,3,1);
imshow(X, [0 255]),
title('Orjinal Görüntü')

input=double(X);
for n=1:8
for i=1:size(input,1)
  for j=1:size(input,2)
     if bitand(input(i,j),(2^(8-n))) == (2^(8-n)) 
        output(i,j)=255;
     else
        output(i,j)=0;
     end   
  end 
end
subplot(3,3,n+1);
imshow(output, [0 255]);
title(sprintf('%d. bit Görüntüsü',8-n))
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%