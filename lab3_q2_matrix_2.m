I=[1 1 0 1 1 1 0 1;
    1 1 0 1 0 1 0 1;
    1 1 1 1 0 0 0 1;
    0 0 0 0 0 0 0 1;
    1 1 1 1 0 1 0 1;
    0 0 0 1 0 1 0 1;
    1 1 0 1 0 0 0 1;
    1 1 0 1 0 1 1 1];
    
I=padarray(I,[1,1],'both');
[m,n]=size(I);
label=2;
for i=1:m
    for j=1:n
        if (I(i,j)==0)
            continue;
        else
            if I(i,j-1)==0&&I(i-1,j)==0
                I(i,j)=label;
                label=label+1;
            end
            if I(i,j-1)~=0||I(i-1,j)~=0
                if (I(i,j-1)==0)
                    I(i,j)=I(i-1,j);
                else
                    if(I(i-1,j)==0)
                        I(i,j)=I(i,j-1);
                    else
                        conflict=min(I(i,j-1),I(i-1,j));
                        I(i,j)=conflict;
                    end
                    end
                end
            end
        end
    end
    disp("L");
    disp(I);
    for count=1:2
        for i=1:m
            for j=1:n
                if I(i,j)==0
                    continue;
                else
            if  I(i,j-1)~=0||I(i-1,j)~=0||I(i,j+1)~=0||I(i+1,j)~=0
                N1=I(i-1,j);
                N2=I(i,j-1);
                N3=I(i+1,j);
                N4=I(i,j+1);
                N_values=[N1,N2,N3,N4];
                N=nonzeros(N_values);
                min_value=min(N);
                I(i,j)=min_value;
            end
                end
            end
        end
    end

disp("H")
disp(I);
Image=imread('circbw.tif');
imshow(Image);
stas=regionprops('table',Image,'centroid','area','perimeter');
disp(stas);
