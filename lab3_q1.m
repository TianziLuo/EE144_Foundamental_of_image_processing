%% problrm1 Binary image morphology
f=imread('blobs.png');
B=[0,1,0;1,1,1;0,1,0];
Z1=imerode(f,B);
D1=imdilate(f,B);
Opening=imdilate(Z1,B);
Closing=imerode(D1,B);
figure,imshow(f),title('origin image');
figure,subplot(2,2,1),imshow(Z1),title('erosion image');
subplot(2,2,2),imshow(D1),title('dilation image');
subplot(2,2,3),imshow(Opening),title('opining image');
subplot(2,2,4),imshow(Closing),title('closing image');

