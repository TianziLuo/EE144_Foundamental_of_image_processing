I=imread('lines.jpg');
I2=rgb2gray(I);
S=edge(I2,'Sobel');
S1=edge(I2,'Sobel',0.01);
S2=edge(I2,'Sobel',0.1);
S3=edge(I2,'Sobel',0.2);
figure;
subplot(1,2,1),imshow(I2),title('Original image');
subplot(1,2,2),imshow(S),title('Sobel opeartor');
figure;
subplot(1,3,1),imshow(S1),title('Sobel operator 0.01');
subplot(1,3,2),imshow(S2),title('Sobel operator 0.1');
subplot(1,3,3),imshow(S3),title('Sobel operator 0.2');
%%
figure
imshow(S1),title('thresholds 0.01')
hold on

[H1,T1,R1] = hough(S1,'Theta',20:0.1:75);

Peaks=houghpeaks(H1,5);

lines=houghlines(S1,T1,R1,Peaks);

 for k=1:length(lines)
xy=[lines(k).point1;lines(k).point2];   
plot(xy(:,1),xy(:,2),'LineWidth',4);
 end

[H2,T2,R2] = hough(S1,'Theta',-75:0.1:-20);
Peaks1=houghpeaks(H2,5);
lines1=houghlines(S1,T2,R2,Peaks1);
for k=1:length(lines1)
xy1=[lines1(k).point1;lines1(k).point2];   
plot(xy1(:,1),xy1(:,2),'LineWidth',4);
end

hold off
%%
figure
imshow(S1),title('thresholds 0.1')
hold on

[H1,T1,R1] = hough(S2,'Theta',20:0.1:75);

Peaks=houghpeaks(H1,5);

lines=houghlines(S2,T1,R1,Peaks);

 for k=1:length(lines)
xy=[lines(k).point1;lines(k).point2];   
plot(xy(:,1),xy(:,2),'LineWidth',4);
 end

[H2,T2,R2] = hough(S2,'Theta',-75:0.1:-20);
Peaks1=houghpeaks(H2,5);
lines1=houghlines(S2,T2,R2,Peaks1);
for k=1:length(lines1)
xy1=[lines1(k).point1;lines1(k).point2];   
plot(xy1(:,1),xy1(:,2),'LineWidth',4);
end

hold off
%%
figure
imshow (S3),title('threshold 0.2');
hold on

[H1,T1,R1] = hough(S3,'Theta',20:0.1:75);

Peaks=houghpeaks(H1,5);

lines=houghlines(S3,T1,R1,Peaks);

 for k=1:length(lines)
xy=[lines(k).point1;lines(k).point2];   
plot(xy(:,1),xy(:,2),'LineWidth',4);
 end

[H2,T2,R2] = hough(S3,'Theta',-75:0.1:-20);
Peaks1=houghpeaks(H2,5);
lines1=houghlines(S3,T2,R2,Peaks1);
for k=1:length(lines1)
xy1=[lines1(k).point1;lines1(k).point2];   
plot(xy1(:,1),xy1(:,2),'LineWidth',4);
end

hold off
%% parrallel
I3=imread('parallel.jpg');
I4=rgb2gray(I3);
S4=edge(I4,'Sobel');
figure
imshow (S4),title('parallel');
hold on

[H1,T1,R1] = hough(S4,'Theta',20:0.1:75);

Peaks=houghpeaks(H1,5);

lines=houghlines(S4,T1,R1,Peaks);

 for k=1:length(lines)
xy=[lines(k).point1;lines(k).point2];   
plot(xy(:,1),xy(:,2),'LineWidth',4);
 end

[H2,T2,R2] = hough(S4,'Theta',-75:0.1:-20);
Peaks1=houghpeaks(H2,5);
lines1=houghlines(S4,T2,R2,Peaks1);
for k=1:length(lines1)
xy1=[lines1(k).point1;lines1(k).point2];   
plot(xy1(:,1),xy1(:,2),'LineWidth',4);
end

hold off