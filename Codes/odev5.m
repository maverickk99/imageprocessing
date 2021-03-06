%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%5)Fourier Transform ve 3d graf%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;clc;clf;
resim=imread('odev5.jpg');
subplot(2,2,1);
imshow(resim);
title('Ojinal Resim');
subplot(2,2,2);

resim=double(resim);
surfl(abs(resim));shading('interp');colormap('copper');
title('Resimin 3 Boyutlu görüntüsü');
%frekans bileşenleini merkezde toplama
for x=1:size(resim,1);
	for y=1:size(resim,2);
      resim(x,y)=resim(x,y).*(-1).^(x+y);
  end
end
%frekans bileşenleini merkezde toplama (Matlab)
Fourier=fft2(resim);

%F=fftshift(F);
%F=F.*255/max(max(F));% F değerlerini max 256 ile sınırlama
s=log(abs(Fourier)+1);
s=s.*255/max(max(s));%s değerlerini max 256 ile sınırlama

subplot(2,2,3);
imshow(s,[0 255]);
title('FFT Görüntüsü');

subplot(2,2,4);
surfl(abs(Fourier));shading('interp'); colormap('copper');
title('FFT nin 3 Boyutlu Görüntüsü');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
