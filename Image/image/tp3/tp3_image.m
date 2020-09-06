%% TP3
%%
imgFluo=double(imread('0.png'))/255;
imgIncand=double(imread('1.png'))/255;
figure(1);
subplot(1,2,1);imshow(imgFluo,[]);
subplot(1,2,2);imshow(imgIncand,[]);
figure(2);
plot(imgFluo(50,:),'r');hold on;
plot(imgIncand(50,:),'b');

%%
se=strel('disk',5);
imgFond=imclose(imgIncand,se);
figure(3);
imshow(imgFond,[]);
figure(4);
plot(imgFond(50,:),'r');hold on;
plot(imgIncand(50,:),'b');
%Non,les caract¨¨res ne sont pas compl¨¨tement supprim¨¦s.

%%
se1=strel('disk',7);
imgFond1=imclose(imgIncand,se1);
figure(5);
imshow(imgFond1,[]);
figure(6);
plot(imgFond1(50,:),'r');hold on;
plot(imgIncand(50,:),'b');

se2=strel('disk',10);
imgFond2=imclose(imgIncand,se2);
figure(7);
imshow(imgFond2,[]);
figure(8);
plot(imgFond2(50,:),'r');hold on;
plot(imgIncand(50,:),'b');

se3=strel('disk',15);
imgFond3=imclose(imgIncand,se3);
figure(9);
imshow(imgFond3,[]);
figure(10);
plot(imgFond3(50,:),'r');hold on;
plot(imgIncand(50,:),'b');

%%
imgCor=imgIncand-imgFond3;
figure(11);
imshow(imgCor,[]);

%%
figure(12);
subplot(1,3,1);imshow(imgFluo,[]);
subplot(1,3,2);imshow(imgIncand,[]);
subplot(1,3,3);imshow(imgCor,[]);
figure(13);
plot(imgFluo(50,:),'r');hold on;
plot(imgIncand(50,:),'b');
plot(imgCor(50,:),'g');

%%
%Apr¨¨s le traitement, le r¨¦sultat est meilleur.Le fond est fondamentalement
%enlev¨¦.Mais il y a encore des diff¨¦rences entre la lumi¨¨re et l'obscurit¨¦.
