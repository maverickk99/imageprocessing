%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%4)ÝSKELET GÖRÜNTÜSÜ ÜZERÝNDE ÝÞLEMLER%%%%%%%%
%%%%UZAYSAL SÜZGEÇ UYGULAMASI%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;clc;clf;

[X]=imread('.jpg');
orjinal=double(X);
subplot(2,4,1);
imshow(X, [0 255]);
title('1)Orjinal Resim');

L=[0 -1 0;
  -1 4 -1;
   0 -1 0];
laplace=filter2(L,orjinal);
subplot(2,4,2);
laplace2=laplace+128;
imshow(laplace2,[0 255]);
title('2)Laplasý Alýnmýþ Resim')

orj_lap=orjinal+laplace;
subplot(2,4,3);
imshow(orj_lap,[0 255]);
title('3) 1 + 2 ')

sobel_dikey=[-1 -2 -1;0 0 0;1 2 1];
sobel_yatay=[-1 0 1;-2 0 2;-1 0 1];
sobel_d=abs(filter2(sobel_dikey,orjinal));
sobel_y=abs(filter2(sobel_yatay,orjinal));
sobel=sobel_d+sobel_y;
subplot(2,4,4);
imshow(sobel,[0 255]);
title('4)Orjinal Görüntünün Sobeli')

orta=[1 1 1 1 1;
      1 1 1 1 1;
      1 1 1 1 1;
      1 1 1 1 1;
      1 1 1 1 1];
orta=orta/25;
ortalama_resim=filter2(orta,sobel);
subplot(2,4,5);
imshow(ortalama_resim,[0 255]);
title('5)5x5 bloklar kalinde ortalanmýþ resim')

ort_lap=((ortalama_resim/256).*(orj_lap/256))*256;
subplot(2,4,6);
imshow(ort_lap,[0 255]);
title('6)5 + 3')

cef=ort_lap+orjinal;
subplot(2,4,7);
imshow(cef,[0 255]);
title('7)1 + 6')

plaw1=log((1+cef));
ma=256./abs(max(max(plaw1)));
plaw=ma.*plaw1;
subplot(2,4,8);
imshow(plaw,[0 255]);
title('8)7. resme (256/max)*log(1+r) uygulanmýþ')