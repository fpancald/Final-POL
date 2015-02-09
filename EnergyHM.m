function [xp,sp,xwp,swp,lowedge,upedge,delta,LE,E,subH,H]=EnergyHM(T,k,c,p)
warning('off','MATLAB:singularMatrix');
warning('off','MATLAB:nearlySingularMatrix');
l=length(T);
E=[];

for i=1:l
    n=length(T{i});
    E=[E ; EnergyMatrix(T{i},k,c,p)];
end
m=length(p);
mx=log10(max(max((E(:,2:end))')));
%mx=log10(min(max((E(:,2:end))')));
Es=0:mx/(10*(m-1)):mx;
LE=log10(E);
mm=length(Es);
H=zeros(mm-1,m-1);
for i=2:mm
    for j=2:m
        for h=1:l
            if Es(i)>LE(h,j)
                H(i-1,j-1)=H(i-1,j-1)+1;
            end
        end
    end
end
figure(1)
colormap('jet')
imagesc(p(2:end),Es(2:end),H)
set(gca,'YDir','normal')
colorbar

delta=[];
lowedge=[];
upedge=[];
xp=[];
sp=[];
xwp=[];
swp=[];
k=2;
plotstep=500;
for j=2:m
    xp=[xp mean(H(:,j-1))];
    sp=[sp std(H(:,j-1))];
    Hwp=H(:,j-1);
    Hwp=Hwp(Hwp~=0);
    Hwp=Hwp(Hwp~=l);
    xwp=[xwp mean(Hwp)];
    swp=[swp std(Hwp)];
    startpt=0;
    endpt=mx;
    for i=2:mm
        if startpt==0
            if H(i-1,j-1)>0
                startpt=Es(i-1);
                
            end
        end
        if endpt==mx
            if H(i-1,j-1)==l
                endpt=Es(i);
                
            end
        end
    end
    lowedge=[lowedge startpt];
    upedge=[upedge endpt];
    delta=[delta (endpt-startpt)];
    if mod(j,plotstep)==1
        figure(k)
        plot(Es(2:end),H(:,j-1));
        title(num2str(p(j)));
        k=k+1;
    end
end
warning('on','MATLAB:singularMatrix'); 
warning('on','MATLAB:nearlySingularMatrix');
figure(k)
plot(p(2:end),delta);
figure(k+1)
plot(p(2:end),lowedge);
hold on
plot(p(2:end),upedge);
hold off
figure(k+2)
plot(p(2:end),xp);
figure(k+3)
plot(p(2:end),sp);
figure(k+4)
plot(p(2:end),xwp);
figure(k+5)
plot(p(2:end),swp);
subH=H;
for i=2:mm
    for j=2:m
        for h=1:l
            if H(i-1,j-1)>0 && H(i-1,j-1)<l
                subH(i-1,j-1)=l/2;
            end
        end
    end
end
figure(k+6)
colormap('jet')
imagesc(p(2:end),Es(2:end),subH)
set(gca,'YDir','normal')
colorbar
end