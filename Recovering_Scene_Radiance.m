function J = Recovering_Scene_Radiance(hazy_image,A,t)
%Generating the unhazed image 

[r,c,m]=size(hazy_image);
t0=0.1;     %To restrict the transmission t by a lower bound t0

for i=1:r
    for j=1:c
        for k=1:m
            max_t=max(t(i,j),t0);
            J(i,j,k)=((hazy_image(i,j,k)-A(1,k))/max_t)+A(1,k);
        end
    end
end