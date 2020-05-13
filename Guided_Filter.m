function FG=Guided_Filter(t,hazy_image,w_size)
[r,c,m] = size(hazy_image);   %Size of hazy image
epsilon = 10^(-3);  %We set it to this constant
p = floor((w_size-1)/2);   %For padding
hazy_image_padded= padarray(hazy_image,[p,p],'replicate','both'); 
t_padded= padarray(t,[p,p],'replicate','both'); 
op=zeros(r,c,m); %Initializing

if m==3 %For RGB
    for i=1:r
        for j=1:c
            wk=hazy_image_padded(i:i+w_size-1,j:j+w_size-1,1:m);    %Window of image
            [p,q,r]=size(wk);
            w=p*q;
            tk=t_padded(i:i+w_size-1,j:j+w_size-1); %Window of transmission
        
            mean_wk1 = (sum(sum(wk(:,:,1))))/w;     mean_wk2 = (sum(sum(wk(:,:,2))))/w;     mean_wk3 = (sum(sum(wk(:,:,3))))/w;  
            mean_t = (sum(sum(tk(:,:))))/w;
        
            corr_wk1 = (sum(sum(wk(:,:,1).*wk(:,:,1))))/w;  corr_wk2 = (sum(sum(wk(:,:,2).*wk(:,:,2))))/w;  corr_wk3 = (sum(sum(wk(:,:,3).*wk(:,:,3))))/w;
            corr_wk1_t = (sum(sum(wk(:,:,1).*tk(:,:))))/w;  corr_wk2_t = (sum(sum(wk(:,:,2).*tk(:,:))))/w;  corr_wk3_t = (sum(sum(wk(:,:,3).*tk(:,:))))/w;
        
            var_wk1 = corr_wk1 - (mean_wk1.*mean_wk1);  var_wk2 = corr_wk2 - (mean_wk2.*mean_wk2);  var_wk3 = corr_wk3 - (mean_wk3.*mean_wk3);
            cov_wk1_t = corr_wk1_t - (mean_wk1.*mean_t);     cov_wk2_t = corr_wk2_t - (mean_wk2.*mean_t);    cov_wk3_t = corr_wk3_t - (mean_wk3.*mean_t);
        
            a1=cov_wk1_t./(var_wk1+epsilon);    a2=cov_wk2_t./(var_wk2+epsilon);    a3=cov_wk3_t./(var_wk3+epsilon);
            b1=mean_t-(a1.*mean_wk1);   b2=mean_t-(a2.*mean_wk2);   b3=mean_t-(a3.*mean_wk3);
        
            op(i,j,1)=0;   op(i,j,2)=0;  op(i,j,3)=0;
            for f=1:p
                for g=1:q
                op(i,j,1)=op(i,j,1)+((a1.*wk(f,g,1))+b1);
                op(i,j,2)=op(i,j,2)+((a2.*wk(f,g,2))+b2);
                op(i,j,3)=op(i,j,3)+((a3.*wk(f,g,3))+b3);
                end
            end
        end
    end
end
if ~isequal(m,3)    %For Gray
    for i=1:r
        for j=1:c
            wk=hazy_image_padded(i:i+w_size-1,j:j+w_size-1);
            [p,q]=size(wk);
            w=p*q;
            tk=t_padded(i:i+w_size-1,j:j+w_size-1);
        
            mean_wk1 = (sum(sum(wk(:,:))))/w;
            mean_t = (sum(sum(tk(:,:))))/w;
        
            corr_wk1 = (sum(sum(wk(:,:).*wk(:,:))))/w;
            corr_wk1_t = (sum(sum(wk(:,:).*tk(:,:))))/w;
        
            var_wk1 = corr_wk1 - (mean_wk1.*mean_wk1);
            cov_wk1_t = corr_wk1_t - (mean_wk1.*mean_t);
        
            a1=cov_wk1_t./(var_wk1+epsilon);
            b1=mean_t-(a1.*mean_wk1);
        
            op(i,j)=0;
            for f=1:p
                for g=1:q
                op(i,j)=op(i,j)+((a1.*wk(f,g))+b1);
                end
            end
        end
    end
end
    
op=op/w;
FG=op;
if m==3
    FG=rgb2gray(op);
end