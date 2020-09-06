
%% TD3

%% Question 1
img=load('img_kinect/a_ouverte.txt');
figure
imshow(img,[]);colorbar;axis on

%% Question 3
mini=min(img(:))
maxi=max(img(:))
[mini,maxi]
 
figure
subplot(1,2,1);imshow(img,[]);colorbar;axis on
subplot(1,2,2);imshow(img/37,[]);colorbar;axis on

%% Question 4
img1=(img>800&img<4000).*img;
figure
imshow(img1,[]);colorbar;axis on

%% Question 5
figure
hist(img1(:),50);

%% Question 6
img2=(img>1310&img<1630);
figure
imshow(img2,[]);colorbar;axis on

%% Question 7
rep = 'img_kinect/';
ext = '*.txt';
chemin = fullfile(rep, ext);
list = dir(chemin);
for n = 1:numel(list)
   fprintf(list(n).name);
   img = load([rep,list(n).name]);
   figure(5)
   subplot(4,3,n);imshow(img,[]);title(list(n).name);
   imgCorps =(img>1000&img<2000); % segmentation : ? complèter
   figure(6)
   subplot(4,3,n);imshow(imgCorps,[]);title(list(n).name);
end

%% Question 10
CoordMain=load('coordMain.txt')

for n=1:1:numel(list)
    img=load(strcat(rep,list(n).name));
    coord=CoordMain(n,:);
    [xmin,xmax,ymin,ymax]=CalculFenetre(coord(1,2),coord(1,1),50);
    imgFen=img(xmin:xmax,ymin:ymax);
    figure(7);
 
    subplot(4,3,n);
    imshow(imgFen,[]);
end

%% Question 11
for n=1:numel(list)
    img=load(strcat(rep,list(n).name));
    coord=CoordMain(n,:);
    [xmin,xmax,ymin,ymax]=CalculFenetre(coord(1,2),coord(1,1),50);
    imgFen=img(xmin:xmax,ymin:ymax);
    v=img(coord(1,2),coord(1,1));
    seuilBas=v-100;
    seuilHaut=v+25;
    imgFenS=double((imgFen>=seuilBas)&(imgFen<=seuilHaut));
    figure(8)
    subplot(4,3,n);imshow(imgFen,[]);
    figure(9)
    subplot(4,3,n);imshow(imgFenS,[]);
end

%% Question 12
for n=1:numel(list)
    img=load(strcat(rep,list(n).name));
    coord=CoordMain(n,:);
    [xmin,xmax,ymin,ymax]=CalculFenetre(coord(1,2),coord(1,1),50);
    imgFen=img(xmin:xmax,ymin:ymax);
    v=img(coord(1,2),coord(1,1));
    seuilBas=v-100;
    seuilHaut=v+25;
    imgFenS=double((imgFen>=seuilBas)&(imgFen<=seuilHaut));
    imgFenS_open=imopen(imgFenS,strel('disk',7));
    figure(10)
    subplot(4,3,n);imshow(imgFenS,[]);
    figure(11)
    subplot(4,3,n);imshow(imgFenS_open,[]);
    img_diff=imgFenS-imgFenS_open;
    rapp_pix_supp_2_pix_ini=sum(sum(img_diff))/sum(sum(imgFenS))
    figure(12)
    subplot(4,3,n);imshow(img_diff,[]);
    figure(13)
    if rapp_pix_supp_2_pix_ini>0.25
        subplot(4,3,n);imshow(imgFenS,[]);
    end
end

%% Question 13
for n=1:numel(list)
    img=load(strcat(rep,list(n).name));
    coord=CoordMain(n,:);
    [xmin,xmax,ymin,ymax]=CalculFenetre(coord(1,2),coord(1,1),50);
    imgFen=img(xmin:xmax,ymin:ymax);
    v=img(coord(1,2),coord(1,1));
    seuilBas=v-100;
    seuilHaut=v+25;
    imgFenS=double((imgFen>=seuilBas)&(imgFen<=seuilHaut));
    imgFenS_open=imclose(imgFenS,strel('disk',10));
    figure(14)
    subplot(4,3,n);imshow(imgFenS,[]);
    figure(15)
    subplot(4,3,n);imshow(imgFenS_open,[]);
    img_diff=-imgFenS+imgFenS_open;
    rapp_pix_supp_2_pix_ini=sum(sum(img_diff))/sum(sum(imgFenS))
    figure(16)
    subplot(4,3,n);imshow(img_diff,[]);
    figure(17)
    if rapp_pix_supp_2_pix_ini>0.2
        subplot(4,3,n);imshow(imgFenS,[]);
    end
end

