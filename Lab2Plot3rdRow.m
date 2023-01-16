function  Lab2Plot3rdRow(gray_scale_image,num)
var_fore=zeros(1,256);
var_back=zeros(1,256);
var_btw=zeros(1,256);
mn=numel(gray_scale_image);
for q=0:255
    c0= gray_scale_image<=q;
    n0=sum(c0(:));
    n1=mn-n0;
    var_btw(q+1)= n0*n1*(mean(im2double((gray_scale_image(gray_scale_image>q))))-mean(im2double((gray_scale_image(gray_scale_image<=q))))  )^2/(mn)^2;
    var_fore(q+1)=var(im2double((gray_scale_image(gray_scale_image>q))));
    var_back(q+1)=var(im2double((gray_scale_image(gray_scale_image<=q))));

end
[counts,bins]=imhist(gray_scale_image);
imhist(gray_scale_image);
hold on 
var_fore_n=num*median(counts)/max(var_fore)*var_fore;
var_back_n=num*median(counts)/max(var_back)*var_back;
var_btw_n =num*median(counts)/max(var_btw)*var_btw;
plot(bins,var_fore_n, bins, var_back_n, bins,var_btw_n )
legend('histogram','foregroundVar','backgroundVar','betweenVar')
end 