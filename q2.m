clear all; clc ;
ori_im = imread('shapesCorner.tif');     
 
if(size(ori_im,3)==3)
    ori_im = rgb2gray(uint8(ori_im));  
end
 
% fx = [5 0 -5;8 0 -8;5 0 -5];         
fx = [-2 -1 0 1 2];                
Ix = filter2(fx,ori_im);             
% fy = [5 8 5;0 0 0;-5 -8 -5];         
fy = [-2;-1;0;1;2];                 
Iy = filter2(fy,ori_im);             
Ix2 = Ix.^2;
Iy2 = Iy.^2;
Ixy = Ix.*Iy;
clear Ix;
clear Iy;
 
h= fspecial('gaussian',[7 7],2);     
Ix2 = filter2(h,Ix2);
Iy2 = filter2(h,Iy2);
Ixy = filter2(h,Ixy);
 
height = size(ori_im,1);
width = size(ori_im,2);
result = zeros(height,width);        
 
R = zeros(height,width);
for i = 1:height
    for j = 1:width
        M = [Ix2(i,j) Ixy(i,j);Ixy(i,j) Iy2(i,j)];            
        R(i,j) = det(M)-0.06*(trace(M))^2;   
    end
end
cnt = 0;
for i = 2:height-1
    for j = 2:width-1
        if  R(i,j) > R(i-1,j-1) && R(i,j) > R(i-1,j) && R(i,j) > R(i-1,j+1) && R(i,j) > R(i,j-1) && R(i,j) > R(i,j+1) && R(i,j) > R(i+1,j-1) && R(i,j) > R(i+1,j) && R(i,j) > R(i+1,j+1)
            result(i,j) = 1;
            cnt = cnt+1;
        end
    end
end
Rsort=zeros(cnt,1);
[posr, posc] = find(result == 1);
for i=1:cnt
    Rsort(i)=R(posr(i),posc(i));
end
[Rsort,ix]=sort(Rsort,1);
Rsort=flipud(Rsort);
ix=flipud(ix);
ps=100;
posr2=zeros(ps,1);
posc2=zeros(ps,1);
for i=1:ps
    posr2(i)=posr(ix(i));
    posc2(i)=posc(ix(i));
end
   
imshow(ori_im);
hold on;
plot(posc2,posr2,'g+'),title('original')
figure;
%% change the threshold
 clc ;
 
ori_im = imread('shapesCorner.tif');     
 
if(size(ori_im,3)==3)
    ori_im = rgb2gray(uint8(ori_im));  
end
 I=edge(ori_im,'Sobel',0.1);
% fx = [5 0 -5;8 0 -8;5 0 -5];         
fx = [-2 -1 0 1 2];                 
Ix = filter2(fx,I);             
% fy = [5 8 5;0 0 0;-5 -8 -5];       
fy = [-2;-1;0;1;2];                
Iy = filter2(fy,I);             
Ix2 = Ix.^2;
Iy2 = Iy.^2;
Ixy = Ix.*Iy;
clear Ix;
clear Iy;
 
h= fspecial('gaussian',[7 7],2);      
 
Ix2 = filter2(h,Ix2);
Iy2 = filter2(h,Iy2);
Ixy = filter2(h,Ixy);
 
height = size(I,1);
width = size(I,2);
result = zeros(height,width);       
 
R = zeros(height,width);
for i = 1:height
    for j = 1:width
        M = [Ix2(i,j) Ixy(i,j);Ixy(i,j) Iy2(i,j)];            
        R(i,j) = det(M)-0.06*(trace(M))^2;   
    end
end
cnt = 0;
for i = 2:height-1
    for j = 2:width-1
     
        if  R(i,j) > R(i-1,j-1) && R(i,j) > R(i-1,j) && R(i,j) > R(i-1,j+1) && R(i,j) > R(i,j-1) && R(i,j) > R(i,j+1) && R(i,j) > R(i+1,j-1) && R(i,j) > R(i+1,j) && R(i,j) > R(i+1,j+1)
            result(i,j) = 1;
            cnt = cnt+1;
        end
    end
end
Rsort=zeros(cnt,1);
[posr, posc] = find(result == 1);
for i=1:cnt
    Rsort(i)=R(posr(i),posc(i));
end
[Rsort,ix]=sort(Rsort,1);
Rsort=flipud(Rsort);
ix=flipud(ix);
ps=100;
posr2=zeros(ps,1);
posc2=zeros(ps,1);
for i=1:ps
    posr2(i)=posr(ix(i));
    posc2(i)=posc(ix(i));
end
   
imshow(ori_im);
hold on;
plot(posc2,posr2,'g+'),title('threshold 0.1')
figure;

 clc ;
 
ori_im = imread('shapesCorner.tif');     
if(size(ori_im,3)==3)
    ori_im = rgb2gray(uint8(ori_im));  
end
 I2=edge(ori_im,'Sobel',0.05);
% fx = [5 0 -5;8 0 -8;5 0 -5];        
fx = [-2 -1 0 1 2];                 
Ix = filter2(fx,I2);              
% fy = [5 8 5;0 0 0;-5 -8 -5];          
fy = [-2;-1;0;1;2];                
Iy = filter2(fy,I2);              
Ix2 = Ix.^2;
Iy2 = Iy.^2;
Ixy = Ix.*Iy;
clear Ix;
clear Iy;
 
h= fspecial('gaussian',[7 7],2);      
 
Ix2 = filter2(h,Ix2);
Iy2 = filter2(h,Iy2);
Ixy = filter2(h,Ixy);
 
height = size(I2,1);
width = size(I2,2);
result = zeros(height,width);       
 
R = zeros(height,width);
for i = 1:height
    for j = 1:width
        M = [Ix2(i,j) Ixy(i,j);Ixy(i,j) Iy2(i,j)];             % auto correlation matrix
        R(i,j) = det(M)-0.06*(trace(M))^2;   
    end
end
cnt = 0;
for i = 2:height-1
    for j = 2:width-1
        % 进行非极大抑制，窗口大小3*3
        if  R(i,j) > R(i-1,j-1) && R(i,j) > R(i-1,j) && R(i,j) > R(i-1,j+1) && R(i,j) > R(i,j-1) && R(i,j) > R(i,j+1) && R(i,j) > R(i+1,j-1) && R(i,j) > R(i+1,j) && R(i,j) > R(i+1,j+1)
            result(i,j) = 1;
            cnt = cnt+1;
        end
    end
end
Rsort=zeros(cnt,1);
[posr, posc] = find(result == 1);
for i=1:cnt
    Rsort(i)=R(posr(i),posc(i));
end
[Rsort,ix]=sort(Rsort,1);
Rsort=flipud(Rsort);
ix=flipud(ix);
ps=100;
posr2=zeros(ps,1);
posc2=zeros(ps,1);
for i=1:ps
    posr2(i)=posr(ix(i));
    posc2(i)=posc(ix(i));
end
   
imshow(ori_im);
hold on;
plot(posc2,posr2,'g+'),title('threshold 0.05')
figure;
%% different neighborhood
clc ;
zori_im = imread('shapesCorner.tif');     
 
if(size(ori_im,3)==3)
    ori_im = rgb2gray(uint8(ori_im));  
end
 
% fx = [5 0 -5;8 0 -8;5 0 -5];         
fx = [-2 -1 0 1 2];                
Ix = filter2(fx,ori_im);             
% fy = [5 8 5;0 0 0;-5 -8 -5];         
fy = [-2;-1;0;1;2];                 
Iy = filter2(fy,ori_im);             
Ix2 = Ix.^2;
Iy2 = Iy.^2;
Ixy = Ix.*Iy;
clear Ix;
clear Iy;
 
h= fspecial('gaussian',[7 7],2);     
Ix2 = filter2(h,Ix2);
Iy2 = filter2(h,Iy2);
Ixy = filter2(h,Ixy);
 
height = size(ori_im,1);
width = size(ori_im,2);
result = zeros(height,width);        
 
R = zeros(height,width);
for i = 1:height
    for j = 1:width
        M = [Ix2(i,j) Ixy(i,j);Ixy(i,j) Iy2(i,j)];            
        R(i,j) = det(M)-0.06*(trace(M))^2;   
    end
end
cnt = 0;
for i = 2:height-1
    for j = 2:width-1
       if  R(i,j) > R(i-1,j-1) && R(i,j) > R(i-1,j) && R(i,j) > R(i-1,j+1) && R(i,j) > R(i,j-1) && R(i,j) > R(i,j+1) && R(i,j) > R(i+1,j-1) && R(i,j) > R(i+1,j) && R(i,j) > R(i+1,j+1)&& R(i,j) > R(i-2,j+2)&& R(i,j) > R(i-2,j+1)&& R(i,j) > R(i-2,j)&& R(i,j) > R(i-2,j-1)&& R(i,j) > R(i-2,j-2)&& R(i,j) > R(i-1,j+2)&& R(i,j) > R(i-1,j-2)&& R(i,j) > R(i,j-2)&& R(i,j) > R(i,j+2)&& R(i,j) > R(i+1,j+2)&& R(i,j) > R(i+1,j-2)&& R(i,j) > R(i+2,j+2)&& R(i,j) > R(i+2,j+1)&& R(i,j) > R(i+2,j)&& R(i,j) > R(i+2,j-1)&& R(i,j) > R(i+2,j-2)
            result(i,j) = 1;
            cnt = cnt+1;
        end
    end
end
Rsort=zeros(cnt,1);
[posr, posc] = find(result == 1);
for i=1:cnt
    Rsort(i)=R(posr(i),posc(i));
end
[Rsort,ix]=sort(Rsort,1);
Rsort=flipud(Rsort);
ix=flipud(ix);
ps=50;
posr2=zeros(ps,1);
posc2=zeros(ps,1);
for i=1:ps
    posr2(i)=posr(ix(i));
    posc2(i)=posc(ix(i));
end
   
imshow(ori_im);
hold on;
plot(posc2,posr2,'g+'),title('neighborhood radius 5')
figure;
