%% problem 1 ------------------------------------
% transformation used here is rgb2gray
I_gray= imread('bag.png');
I_color = imread('autumn.tif');
I_binary= imread('blobs.png');
figure;
imshow(I_gray);
figure;
imshow(I_color);
figure;
imshow(I_binary);

% show details
whos I_gray I_color I_binary;

%convert rgb to gray
I_c2g = rgb2gray(I_color);
figure;
imshow(I_c2g);
%% prblem 2 -----------------------------------------
% (a)
%  high contrast image has a more uniform histogram 

% low contrast image
figure;
imhist(I_c2g);

% high contrast image
I_highc2g=  histeq(I_c2g);
figure;
imhist(I_highc2g);

% show pair
figure;
imshowpair(I_c2g,I_highc2g,'montage');

%(b)
% binary histogram has only 2 bins: 0 and 1
figure;
imhist(I_binary);

%(c)
% display histgram of color by channel
figure;
imhist(I_color(:,:,1));

figure;
imhist(I_color(:,:,2));

figure;
imhist(I_color(:,:,3));


% display combined histogram
R=imhist(I_color(:,:,1));
G=imhist(I_color(:,:,2));
B=imhist(I_color(:,:,3));
rgb=[R;G;B];
figure;
plot(rgb);

% display 8-bit histogram
%first 3 bit from Red
I_R3bit =bitand(I_color(:,:,1),bin2dec('11100000'));
%then 3 bit from green
I_G3bit =bitand(I_color(:,:,2),bin2dec('00011100'));
% last 2 bit from blue
I_B3bit =bitand(I_color(:,:,3),bin2dec('00000011'));
% 8-bit image
I_8bit= bitor( bitor(I_R3bit,I_G3bit), I_B3bit);
figure;
imhist(I_8bit);

%(d)
figure;
histogram(I_gray,'Normalization','cdf');

%(e)
% mean is 89 , median is 56, the difference between mean and median is large,  var is 0.07, the noise is low 
% Imean=mean(I_gray,[1,2]);
% Imedian=median(I_gray,[1,2]);
% Ivar=var(im2double(I_gray),0,[1,2]);

Imean=mean(mean(I_gray));
Imedian=median(median(I_gray));
Gimage_double=double('bag.png');
Ivar=var(Gimage_double);

