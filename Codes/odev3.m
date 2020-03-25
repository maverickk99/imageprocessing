%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%3)Filter Convolution%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Y] = imread('odev3.jpg');
subplot(1,2,1);
imshow(Y,[0 255]); title('Orjinal Görüntü');
Y=double(Y);
% suzgec = [-1 0 -1 0 -1;
%            0 -1 -1 -1 0;
%           -1 -1 17 -1 -1;
%            0 -1 -1 -1 0;
%           -1 0 -1 0 -1];
suzgec = [0 -1 0;
          -1 5 -1; 
          0 -1 0]; 
satir = size(Y,1);
sutun = size(Y,2);
Z=zeros(satir,sutun);
size_suzgec1 = size(suzgec,1);
size_suzgec2 = size(suzgec,2);
for i=2:satir-size_suzgec1-1
    for j=2:sutun-size_suzgec2-1
        toplam=0;
        for k=1:size_suzgec1
            for l=1:size_suzgec1
                toplam = toplam + Y(i+k-1,j+l-1)*suzgec(k,l);
            end
        end
        Z(i,j)=toplam  ;
    end
end
subplot(1,2,2);
imshow(Z,[0 255]); title('Filtrelenmis Görüntü');