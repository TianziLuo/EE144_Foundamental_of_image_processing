%% problem2 
% img=imread('coins.png');
% imgn=img>128;
% s=uint8(1-imgn);

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
label=2;            %��һ�����ʱ��ǵı�ǩ����
for i=2:m
    for j=2:n-1
        up_left=s(i-1,j-1);             %ԭͼ��ǰ������Χ�ĸ�����
        up=s(i-1,j);
        up_right=s(i-1,j+1);
        left=s(i,j-1);
        cur=s(i,j);
        
        if cur==1
            if cur~=up_left && cur~=up &&cur~=up_right &&cur~=left      %��ǰ�����ܵĶ���һ�������±�ǩ
                tmp(i,j)=label;
                link{label}=[];
                label=label+1;
            else
                t=sort([tmp(i,j-1) tmp(i-1,j-1) tmp(i-1,j) tmp(i-1,j+1)]);  %��ǩͼ��ǰ������Χ�ĸ����ز�����         
                for k=1:4                   %Ѱ����Χ�ĸ����ط������Сֵ��ֵ����ǩͼ��
                    if t(k)~=0
                        tmp(i,j)=t(k);
                        for w=k:4
                            link{t(w)}=union(t(k:4),link{t(w)});     %���ò��ཻ����                
                        end
                        break;
                    end
                end                  
            end           
        end
        
    end
end

for i=1:m
    for j=1:n
        if s(i,j) ~=0
            s(i,j)=find_set(link,tmp(i,j));
        end
    end
end
disp("After second pass")
disp(I);