%% PROBLEM1
close all, clear all, clc
h1=fspecial('average');
h2=fspecial('gaussian');
I1=imread('cameramanGN.tiff');
I1_mean=imfilter(I1,h1);
I1_med=medfilt2(I1);
I1_GN=imfilter(I1,h2);
figure;
subplot(1,4,1),imshow(I1),title('Original image');
subplot(1,4,2),imshow(I1_mean),title('mean filter');
subplot(1,4,3),imshow(I1_med),title('median filter');
subplot(1,4,4),imshow(I1_GN),title('Gaussian filter');

%% 2)
I2=imread('cameramanSPN.tiff');
I2_mean=imfilter(I2,h1);
I2_med=medfilt2(I2);
I2_GN=imfilter(I2,h2);
figure;
subplot(1,4,1),imshow(I2),title('Original image');
subplot(1,4,2),imshow(I2_mean),title('mean filter');
subplot(1,4,3),imshow(I2_med),title('median filter');
subplot(1,4,4),imshow(I2_GN),title('Gaussian filter');

%% PROBLELM2 
% 2)
I3=imread('cameraman.tif');
P=edge(I3,'Prewitt');
S=edge(I3,'Sobel');
L=edge(I3,'log');
C=edge(I3,'canny');
figure;
subplot(1,5,1),imshow(I3),title('Original image');
subplot(1,5,2),imshow(P),title('Prewitt opeartor');
subplot(1,5,3),imshow(S),title('Sobel operator');
subplot(1,5,4),imshow(L),title('LOG opeartor');
subplot(1,5,5),imshow(C),title('Canny opeator');

% 3)
P1=edge(I3,'Prewitt',0.001);
P2=edge(I3,'Prewitt',0.01);
P3=edge(I3,'Prewitt',0.1);
S1=edge(I3,'Sobel',0.001);
S2=edge(I3,'Sobel',0.01);
S3=edge(I3,'Sobel',0.1);
L1=edge(I3,'log',0.001);
L2=edge(I3,'log',0.01);
L3=edge(I3,'log',0.1);
C1=edge(I3,'Canny',0.001);
C2=edge(I3,'Canny',0.01);
C3=edge(I3,'Canny',0.1);
figure;
subplot(4,4,1),imshow(P),title('Prewitt opeartor ');
subplot(4,4,2),imshow(P1),title('Prewitt opeartor 0.001');
subplot(4,4,3),imshow(P2),title('Prewitt opeartor 0.01');
subplot(4,4,4),imshow(P3),title('Prewitt opeartor 0.1');
subplot(4,4,5),imshow(S),title('Sobel operator ');


subplot(4,4,9),imshow(L),title('LOG opeartor ');
subplot(4,4,10),imshow(L1),title('LOG opeartor 0.001');
subplot(4,4,11),imshow(L2),title('LOG opeartor 0.01');
subplot(4,4,12),imshow(L3),title('LOG opeartor 0.1');
subplot(4,4,13),imshow(C),title('Canny opeator ');
subplot(4,4,14),imshow(C1),title('Canny opeator 0.001');
subplot(4,4,15),imshow(C2),title('Canny opeator 0.01');
subplot(4,4,16),imshow(C3),title('Canny opeator 0.1');

%% PROBLEM 3
I4=imread('cameramanBlur.tiff');
c1=0.05;
c2=0.4;
c3=0.7
h=fspecial('laplacian',c1);
I4_La=imfilter(I4,h);
I5= I4-I4_La;
sharp1=imsharpen(I4,'Amount',c1*2);
hi=fspecial('laplacian',c2);
sharp2=imsharpen(I4,'Amount',c2*2);
hii=fspecial('laplacian',c3);
sharp3=imsharpen(I4,'Amount',c2*2);
figure;
subplot(1,5,1),imshow(I4),title('original');
subplot(1,5,2),imshow(I5),title('Lapacian');
subplot(1,5,3),imshow(sharp1),title('sharp c=0.05');
subplot(1,5,4),imshow(sharp2),title('sharp c=0.4');
subplot(1,5,5),imshow(sharp3),title('sharp c=0.7');