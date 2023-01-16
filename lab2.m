%%  1)
G_1=imread('moon.tif');
level_1=graythresh(G_1);
BW1=imbinarize(G_1,level_1);
figure;
imshowpair(G_1,BW1,'montage');

G_2=imread('circuit.tif');
level_2=graythresh(G_2);
BW2=imbinarize(G_2,level_2);
figure;
imshowpair(G_2,BW2,'montage');


G_3c= imread('gray1.jpg');
G_3=rgb2gray(G_3c);
level_3=graythresh(G_3);
BW3=imbinarize(G_3,level_3);
figure;
imshowpair(G_3,BW3,'montage');

G_4c= imread('gray2.jpg');
G_4=rgb2gray(G_4c);
level_4=graythresh(G_4);
BW4=imbinarize(G_4,level_4);
figure;
imshowpair(G_4,BW4,'montage');

%% 2)
figure;
subplot(3,4,1)
imshow(G_1)
subplot(3,4,2)
imshow(G_2)
subplot(3,4,3)
imshow(G_3)
subplot(3,4,4)
imshow(G_4)


subplot(3,4,5)
imshow(BW1)
subplot(3,4,6)
imshow(BW2)
subplot(3,4,7)
imshow(BW3)
subplot(3,4,8)
imshow(BW4)

subplot(3,4,9)
Lab2Plot3rdRow(G_1,10);
subplot(3,4,10)
Lab2Plot3rdRow(G_2,4);
subplot(3,4,11)
Lab2Plot3rdRow(G_3,20);
subplot(3,4,12)
Lab2Plot3rdRow(G_4,200);




