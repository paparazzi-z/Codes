%% ZHOU, Nan/ TD1 "Introduction ? l’imagerie" partie I  

%% Q0 : chargement d'une image
clc; clear all; close all; imtool close all; % efface le wokspace, ferme les fenêtres graphiques  
Nom='TD1/lena.png'; % ici chemin relatif vers l'image lena.png
img = imread(Nom); % charge en mémoire le tableau de niveaux de gris correspondant ? Léna
img = double(img)/255; %  ... 
imtool(img); % 
%% Q1 : matrice image
% Quelle est la taille de la matrice-image img ? Quel est le type des éléments de cette matrice ? Quel est l’emplacement mémoire nécessaire au stockage de cette
% matrice-image ? Sur combien d’octets est stockée une variable de type double dans Matlab ?
%% 
% Ces informations se trouvent dans l'onglet "workspace" (vous pouvez
% visualiser des informations supplémentaires en cliquant ? droite dans la barre propriét? "Name/Value/Size/...") 
%
% * La matrice image a pour taille :256*256.
% * Le type des éléments de la matrice image est  double
% * L'emplacement mémoire nécessaire au stockage de cette matrice est :
% ... ? compléter
% * Un *niveau de gris (NG)* est cod? sur 8 octets

%% Q2 : lien entre NG et couleur du pixel.
% ... ? compléter
%% Q3 : dynamique d’affichage (en anglais "display range") de imtool et dynamique d'image
clc; clear all;
Nom='TD1/lena.png';
img = imread(Nom);
img=double(img)/810;
imtool(img);
%%
clc; clear all;
Nom='TD1/lena.png';
img = imread(Nom);
img=double(img)/100;
imtool(img);
%% Q4
clc; clear all;
Nom='TD1/lena.png';
img=imread(Nom);
img=double(img)/255;
imgTrans=img';
[L,C]=size(img);
for c1=1:1:L
    for c2=1:1:C
        produit(c1,c2)=imgTrans(c1,c2)*img(c1,c2);
    end
end
imshow(produit);
imwrite(imgTrans,'trans.png');
%%
clc; clear all;
Nom='TD1/lena.png';
img=imread(Nom);
img=double(img)/255;
imgTrans=img';
produit=imgTrans.*img;
imshow(produit);
%% Q5
figure;
imshow(img,[]);
colormap(hsv);
colorbar;
%% Q6
clc; clear all; 
img=double(imread('ExempleHisto.PNG'))/255;
imtool(img);
%% Q7
imhist(img,3);
%% Q8
clc; clear all; 
Alnitak=double(imread('Alnitak_NdG.png'))/255;
figure;
imshow(Alnitak,[]);
colorbar;
axis on;
title('Alnitak');
figure;
imhist(Alnitak);
%% Q9
Nebula=imcrop(Alnitak);
figure;
subplot(1,2,1);
imshow(Nebula);
colorbar;
subplot(1,2,2);
imhist(Nebula);
%% Q10
NewNebula=histeq(Nebula);
figure
subplot(2,2,1);
imshow(Nebula);
colorbar
subplot(2,2,2);
imhist(Nebula);
subplot(2,2,3);
imshow(NewNebula);
colorbar
subplot(2,2,4);
imhist(NewNebula);
%% Q11
clear all;clc;
Al_C=imread('Alnitak_couleur.png');
R=Al_C(:,:,1);
G=Al_C(:,:,2);
B=Al_C(:,:,3);
figure
imshow(Al_C);
colorbar
figure
subplot(1,3,1);imhist(R);
subplot(1,3,2);imhist(G);
subplot(1,3,3);imhist(B);

%% Q12
clear all;clc;
Img=zeros(100);
for c1=1:100
 for c2=1:100
 if (c1>30)&&(c1<40)||(c2>40)&&(c2<50)
 Img(c1,c2)=50;
 else
 Img(c1,c2)=c1+c2;
 end
 end
end
Img=Img/(max(Img(:)));
figure
subplot(1,3,1); imshow(Img);
subplot(1,3,2); mesh(Img); axis square
subplot(1,3,3); imhist(Img);
%% Q13
Img1=zeros(100);
Img2=zeros(100);
Img3=zeros(100);
for c1=1:100
    for c2=1:100
        if Img(c1,c2)>0.248
            Img1(c1,c2)=1;
        end
        if Img(c1,c2)<0.248||Img(c1,c2)>0.252
            Img2(c1,c2)=1;
        end
        if Img(c1,c2)<0.252
            Img3(c1,c2)=1;
        end    
    end
end
figure
subplot(1,3,1); imshow(Img1);
subplot(1,3,2); imshow(Img2);
subplot(1,3,3); imshow(Img3);
%% Q14
clc;clear all;
Ple=double(imread('BouteillePleine.TIF'))/255;
Def=double(imread('BouteilleDefault.TIF'))/255;
figure
subplot(1,2,1);imshow(Ple);colorbar
subplot(1,2,2);imshow(Def);colorbar
%%
Ple1=Ple<0.1;
Ple2=Ple>0.1&Ple<0.7;
Ple3=Ple>0.7;
figure
subplot(1,3,1);imshow(Ple1);colorbar
subplot(1,3,2);imshow(Ple2);colorbar
subplot(1,3,3);imshow(Ple3);colorbar
%%
%[L,C]=size(Ple20);
%a=0;
%for c1=1:1:L
%    for c2=1:1:C
%       if Ple==1
%            a=a+1;
%        end
%    end
%end

fond_mini=sum(Ple2(:))*0.9;
fond_max=sum(Ple2(:))*1.1;
vide_max=sum(Ple3(:))*1.1;
fond_mini
fond_max
vide_max

Def1=Def<0.1;
Def2=Def>0.1&Def<0.7;
Def3=Def>0.7;
Liquid=sum(Def2(:));

if Liquid<fond_mini
    fprintf('Il est default\n');
else
    fprintf('Il est pleine\n');
end