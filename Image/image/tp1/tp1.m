%% TP1
%%
imgFluo=imread('0.png');
imgFluoR=imread('1.png');
figure(1);
imshow(imgFluo,[]);
figure(2);
imhist(imgFluo);

imgS1=(imgFluo>0)&(imgFluo<5000);
imgS2=(imgFluo>5000)&(imgFluo<15000);
imgS3=(imgFluo>15000)&(imgFluo<50000);
figure(3);
imshow(imgS1,[]);
figure(4);
imshow(imgS2,[]);
figure(5);
imshow(imgS3,[]);

%Je constates 3 pics dans l¡¯histogramme.
%Le fond est entre 0 et 5000.
%D¨¦s magentas sont entre 5000 et 15000.
%D¨¦s verts et cyans sont entre 15000 et 25000.
%%
figure(6);
imshow(imgFluoR,[]);
figure(7);
imhist(imgFluoR);
imgS4=(imgFluoR>0)&(imgFluoR<15000);
imgS5=(imgFluoR>15000)&(imgFluoR<27000);
imgS6=(imgFluoR>27000)&(imgFluoR<36000);
imgS7=(imgFluoR>36000)&(imgFluoR<50000);
figure(8);
imshow(imgS4,[]);
figure(9);
imshow(imgS5,[]);
figure(10);
imshow(imgS6,[]);
figure(11);
imshow(imgS7,[]);

%On peut extraire de l¡¯image a 4 parties:le fond,d¨¦s magentas,d¨¦s verts et d¨¦s cyans.
%Parce que la source est rouge. Le bleu et le rouge peuvent produire du magenta et le m¨¦lange de vert et de bleu peut produire du cyan. Donc magenta peut refl¨¦ter plus de lumi¨¨re rouge. Donc il est plus clair.


%%
imgDeBleu=(imgS3)&(imgS5);
imgDeCyan=(imgS3)&(imgS6);
imgDeMagenta=(imgS2)&(imgS7);
figure
subplot(1,3,1);imshow(imgDeBleu,[]);
subplot(1,3,2);imshow(imgDeCyan,[]);
subplot(1,3,3);imshow(imgDeMagenta,[]);

