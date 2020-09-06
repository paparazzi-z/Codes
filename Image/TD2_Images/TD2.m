%% TD2 ZHOU-Nan

%% Question 0
I0=double(imread('Tomographie_RayonsX.png')) ;
I1 = double(imread('Tomographie_RayonsX_b.png'));
I2 = double(imread('Tomographie_RayonsX_ps.png'));

I1_manual = imnoise(I0/255,'gaussian',0.1,0.02);
I2_manual = imnoise(I0/255,'salt & pepper');

%% Question 1
Mm=ones(5,5)/25;
Mg=fspecial('gaussian',5,1);
Ifg=imfilter(I0,Mg);
Ifm=imfilter(I0,Mm);
figure
subplot(1,3,1);imshow(I0,[]);colorbar;title('Original');
subplot(1,3,2);imshow(Ifg,[]);colorbar;title('filter Gaussian');
subplot(1,3,3);imshow(Ifm,[]);colorbar;title('filter average');

%% Question 2
I0fm_symmetric=imfilter(I0,Mm,'symmetric');
I0fm_replicate=imfilter(I0,Mm,'replicate');
I0fm_circular=imfilter(I0,Mm,'circular');

figure
subplot(2,2,1);imshow(I0,[]);colorbar;title('Original');
subplot(2,2,2);imshow(I0fm_symmetric,[]);colorbar;title('Fm symmetric');
subplot(2,2,3);imshow(I0fm_replicate,[]);colorbar;title('Fm replicate');
subplot(2,2,4);imshow(I0fm_circular,[]);colorbar;title('Fm circular');

figure
plot(I0(end,:));hold on
plot(I0fm_symmetric(end,:));
plot(I0fm_replicate(end,:));
plot(I0fm_circular(end,:));
h=legend('Original','Fm symmetric','Fm replicate','Fm circular');

figure
subplot(4,2,1);imshow(I0(1:20,70:130),[]);colorbar;title('Zoom-Original');
subplot(4,2,2);imshow(I0(end-20:end,70:130),[]);colorbar;title('Zoom-Original');
subplot(4,2,3);imshow(I0fm_symmetric(1:20,70:130),[]);colorbar;title('Zoom-Symmetric');
subplot(4,2,4);imshow(I0fm_symmetric(end-20:end,70:130),[]);colorbar;title('Zoom-Symmetric');
subplot(4,2,5);imshow(I0fm_replicate(1:20,70:130),[]);colorbar;title('Zoom-Replicate');
subplot(4,2,6);imshow(I0fm_replicate(end-20:end,70:130),[]);colorbar;title('Zoom-Replicate');
subplot(4,2,7);imshow(I0fm_circular(1:20,70:130),[]);colorbar;title('Zoom-Circular');
subplot(4,2,8);imshow(I0fm_circular(end-20:end,70:130),[]);colorbar;title('Zoom-Circular');


%subplot(1,3,1);plot(I0(:,100));
%subplot(1,3,2);plot(Ifg(:,100));
%subplot(1,3,3);plot(Ifm(:,100));
%hold on;

%% Question 3
figure
plot(I0(:,100),'b');hold on;
plot(Ifg(:,100),'k');
plot(Ifm(:,100),'m');
h=legend('Original','Filtre Gaussienne','Filtre Moyenne');

%Ibruit_gauss=imnoise(I,'gaussian',0.1,0.02);
%figure
%imshow(Ibruit_gauss);

%% Question 4
I1fg=imfilter(I1,Mg,'replicate');
I1fm=imfilter(I1,Mm,'replicate');

figure
subplot(1,3,1);imshow(I1,[]);colorbar;axis on;title('I1');
subplot(1,3,2);imshow(I1fg,[]);colorbar;axis on;title('I1 filtre gaussienne');
subplot(1,3,3);imshow(I1fm,[]);colorbar;axis on;title('I1 filtre moyenne');

figure
plot(I1(:,100),'b');hold on;
plot(I1fg(:,100),'k');
plot(I1fm(:,100),'m');
h = legend('Image initiale','Filtrage Gaussien','Filtrage moyenneur');

%%IfgConv=imfilter(I,Mg,'conv','symmetric');
%%IfgConv1=imfilter(I,Mg,'conv');
%%figure
%%subplot(1,2,1);imshow(IfgConv);colorbar;title('Gaussian Convolution');
%%subplot(1,2,2);imshow(IfgConv1);colorbar;title('No Symmetric');

%% Question 5
Ifme=medfilt2(I2,[3,3]);
I2fmed = medfilt2(I2,[5,5]);

figure
subplot(1,3,1);imshow(I2,[]);colorbar;title('salt&pepper');
subplot(1,3,2);imshow(Ifme,[]);colorbar;title('filter median');
subplot(1,3,3);imshow(I2fmed,[]);colorbar;title('filtre median 55');


%% Question 6
I2fg=imfilter(I2,Mg,'replicate');
I2fm=imfilter(I2,Mm,'replicate');

figure
subplot(2,2,1);imshow(I2,[]);colorbar;title('I2');
subplot(2,2,2);imshow(I2fg,[]);colorbar;title('filter Gaussian');
subplot(2,2,3);imshow(I2fm,[]);colorbar;title('filter average');
subplot(2,2,4);imshow(Ifme,[]);colorbar;title('filter median');

figure;
subplot(2,2,1);imshow(I2(5:20,140:155),[]); colorbar; axis on; title('zoom imagebruit');
subplot(2,2,2);imshow(I2fg(5:20,140:155),[]); colorbar; axis on; title('zoom imagefiltr');
subplot(2,2,3);imshow(I2fm(5:20,140:155),[]); colorbar; axis on; title('image filtr');
subplot(2,2,4);imshow(Ifme(5:20,140:155),[]);colorbar;axis on;title('image filtr');

figure;
plot(I2(:,100),'b'); hold on;
plot(I2fg(:,100),'k');
plot(I2fm(:,100),'m');
plot(Ifme(:,100),'r');
title('Comparaison des diff\''{e}rents filtrages sur bruit poivre et sel');
h = legend('Image initiale','Filtrage Gaussien','Filtrage moyenneur','Filtrage median');
%% Question 7
clc;clear;close all;

fond=double(imread('angiographie_fond.tif'))/255;
image=double(imread('angiographie_image.tif'))/255;
Img=image-fond;
figure
subplot(1,3,1);imshow(fond,[]); colorbar; axis on; title('Fond');
subplot(1,3,2);imshow(image,[]); colorbar; axis on;title('Image');
subplot(1,3,3);imshow(Img,[]); colorbar; axis on; title('Image - Fond');

%% Question 8
Mlap=[1 1 1;1 -8 1;1 1 1];
Ifl=imfilter(Img,Mlap,'replicate');

figure
imshow(Ifl,[]);colorbar;title('Filter Laplace');

%% Question 9
Image_finale=Img-Ifl;
figure
subplot(1,2,1);imshow(Image_finale,[]);
subplot(1,2,2);imshow(Image_finale,[min(Img(:)),max(Img(:))]);

%% Question 10
figure;
subplot(2,2,1);imshow(Img(180:300,200:320),[]); colormap('gray'); colorbar; axis on;title('Image - Fond','Interpreter','latex');
subplot(2,2,2);imshow(Ifl(180:300,200:320),[]); colormap('gray'); colorbar; axis on;title('Filtrage Laplacien','Interpreter','latex');
subplot(2,2,3);imshow(Image_finale(180:300,200:320),[]); colormap('gray'); colorbar; axis on;title('Image amelioree','Interpreter','latex');
subplot(2,2,4);imshow(image(180:300,200:320),[]); colormap('gray'); colorbar; axis on;title('Image initiale','Interpreter','latex');
set(gcf,'Name','Zoom sur les images resultats de l''amelioration ducontraste(angiographie)');

%% Question 11
moon=double(imread('Blurry_moon.tif'))/255;
Ifl_moon=imfilter(moon,Mlap);
moon_finale=moon-Ifl_moon;
figure
subplot(1,3,1);imshow(moon);colorbar;title('Original');
subplot(1,3,2);imshow(Ifl_moon,[]);colorbar;title('Laplace');
subplot(1,3,3);imshow(moon_finale);colorbar;title('Finale');