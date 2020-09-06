%% TP5
%%
img1=double(load('nan1.txt'))/3975;
img2=double(load('nan2.txt'))/4068;
img3=double(load('nan3.txt'))/4068;
imgCouleur1=imread('KinectSnapshot-10-24-05.bmp');
imgCouleur2=imread('KinectSnapshot-10-24-27.bmp');
imgCouleur3=imread('KinectSnapshot-10-24-42.bmp');
figure(1);
subplot(1,3,1);imshow(img1,[]);
subplot(1,3,2);imshow(img2,[]);
subplot(1,3,3);imshow(img3,[]);
figure(2);
subplot(1,3,1);imhist(img1);
subplot(1,3,2);imhist(img2);
subplot(1,3,3);imhist(img3);
figure(3);
subplot(1,3,1);imshow(imgCouleur1,[]);
subplot(1,3,2);imshow(imgCouleur2,[]);
subplot(1,3,3);imshow(imgCouleur3,[]);
img1Seg=(img1>0.15)&(img1<0.25);
img2Seg=(img2>0.25)&(img2<0.4);
img3Seg=(img3>0.4)&(img3<0.55);
figure(4);
subplot(1,3,1);imshow(img1Seg,[]);
subplot(1,3,2);imshow(img2Seg,[]);
subplot(1,3,3);imshow(img3Seg,[]);

%les seuils utilis¨¦s ne sont pas identiques pour chaque image.
%%
imgP1=uint8(img1Seg).*imgCouleur1(:,:,1);
imgP2=uint8(img1Seg).*imgCouleur1(:,:,2);
imgP3=uint8(img1Seg).*imgCouleur1(:,:,3);
figure(5);
subplot(1,3,1);imshow(imgP1,[]);
subplot(1,3,2);imshow(imgP2,[]);
subplot(1,3,3);imshow(imgP3,[]);


%%
imgR(:,:,1) = imgP1;
imgR(:,:,2) = imgP2;
imgR(:,:,3) = imgP3;
figure(6);
imshow(imgR,[]);

%%
imgS_Inver=1-img1Seg;
figure(7);
imshow(imgS_Inver,[]);

%%
imgP4=uint8(imgS_Inver).*imgCouleur1(:,:,1);
imgP5=uint8(imgS_Inver).*imgCouleur1(:,:,2);
imgP6=uint8(imgS_Inver).*imgCouleur1(:,:,3);
figure(8);
subplot(1,3,1);imshow(imgP4,[]);
subplot(1,3,2);imshow(imgP5,[]);
subplot(1,3,3);imshow(imgP6,[]);
imgRF(:,:,1) = imgP4;
imgRF(:,:,2) = imgP5;
imgRF(:,:,3) = imgP6;
figure(9);
imshow(imgRF,[]);

%%
imgF=imgR+imgRF;
figure(10);
imshow(imgF,[]);

%% Tester autre photo
imgP7=uint8(img2Seg).*imgCouleur2(:,:,1);
imgP8=uint8(img2Seg).*imgCouleur2(:,:,2);
imgP9=uint8(img2Seg).*imgCouleur2(:,:,3);
figure(11);
subplot(1,3,1);imshow(imgP7,[]);
subplot(1,3,2);imshow(imgP8,[]);
subplot(1,3,3);imshow(imgP9,[]);
imgR1(:,:,1) = imgP7;
imgR1(:,:,2) = imgP8;
imgR1(:,:,3) = imgP9;
figure(12);
imshow(imgR1,[]);
imgS_Inver1=1-img2Seg;
figure(13);
imshow(imgS_Inver1,[]);
imgP10=uint8(imgS_Inver1).*imgCouleur2(:,:,1);
imgP11=uint8(imgS_Inver1).*imgCouleur2(:,:,2);
imgP12=uint8(imgS_Inver1).*imgCouleur2(:,:,3);
figure(14);
subplot(1,3,1);imshow(imgP10,[]);
subplot(1,3,2);imshow(imgP11,[]);
subplot(1,3,3);imshow(imgP12,[]);
imgRF1(:,:,1) = imgP10;
imgRF1(:,:,2) = imgP11;
imgRF1(:,:,3) = imgP12;
figure(15);
imshow(imgRF1,[]);
imgF1=imgR1+imgRF1;
figure(16);
imshow(imgF1,[]);