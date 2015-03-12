%           delta: vector for each p measures the distance between last
%               point with H value =0 and first point with H value =l
%               (distance is measured on the log10 energy axis)
%           upedge: for each p first value of log10 energy for which
%               everyone survives.
%           lowedge: for each p last value of log10 energy for which 
%               everyone dies.
%           xp,sp: for each p mean and std of corresponding column in H
%                   
%           xwp,swp: same as xp and sp but without counting H values=0 or l
%                  hence we take the statistic only inside the
%                  "evolvability window"
%           subH: is the same as H but if the value at the point is >0 and
%               <l (total number of topologies) we redefine the value as l/2
%               this gives us a subcolormap with only 3 regions (no
%               survivor, "evolvability window", and total survivor)

%subH,xp,sp,xwp,swp,entxwp,entstdwp,lowedge,upedge,delta
%p=0:0.01:1;
%compute other outputs and plot p-cross sections of H
m=length(p);
l=length(T);

mx=log10(max(max(E(:,2:end))));      %determine if visualize all the energies in E on y-axis (max-max) or troncate at the minimum one for the smallest non-zero p value
% mx=log10(min(max(E(:,2:end))));     % (min-max). We take the max only on non-zero p values (2:end)

dE=mx/(10*(m-1));
Es=0:dE:mx;                  %the log10 energy axis grid is taken 10 times finer than the p grid (can be changed in the future)
% Es=Es*n;
mm=length(Es);

% LE=log10(E)-log10(n)*ones(size(E)); %gives energy per cell
LE=log10(E);                           %gives energy independent of size

nME=5;

H=zeros(mm-1,m-1);                      %H does not consider the very first log10 energy level (Es=0) and the very first p value (p=0)

%compute H value for each grid point
for i=2:mm
    for j=2:m
        for h=1:l
            if Es(i)>LE(h,j)
                H(i-1,j-1)=H(i-1,j-1)+1;
            end
        end
    end
end

delta=zeros(1,m-1);
lowedge=zeros(1,m-1);
upedge=zeros(1,m-1);

xp=zeros(1,m-1);
sp=zeros(1,m-1);
xwp=zeros(1,m-1);
swp=zeros(1,m-1);
entxwp=zeros(nME,m-1);
entstdwp=zeros(nME,m-1);

xe=zeros(1,mm-1);
se=zeros(1,mm-1);

lb=0.0*l;
ub=1.0*l;

subH=H;

for j=2:m
    xp(1,j-1)=mean(H(:,j-1));
    sp(1,j-1)=std(H(:,j-1));
    Hwp=H(:,j-1);
    Hwp=Hwp(Hwp>lb);
    Hwp=Hwp(Hwp<ub);
    xwp(1,j-1)=mean(Hwp);
    swp(1,j-1)=std(Hwp);
    startpt=0;
    endpt=mx;
    starti=2;
    endi=mm;
    for i=2:mm
        if j==2
            xe(1,i-1)=mean(H(i-1,:));
            se(1,i-1)=std(H(i-1,:));
        end
        if startpt==0
            if H(i-1,j-1)>lb
                startpt=Es(i);
                starti=i;
            end
        end
        if endpt==mx
            if H(i-1,j-1)>=ub
                endpt=Es(i-1);
                endi=i-1;
            end
        end
        %computes subH
        if H(i-1,j-1)>lb && H(i-1,j-1)<ub
            subH(i-1,j-1)=l/2;
        elseif H(i-1,j-1)<=lb
                subH(i-1,j-1)=lb;
        elseif H(i-1,j-1)>=ub
                subH(i-1,j-1)=ub;
        end
    end

    %mean and std in window as energy maximized with respect to mean energy

    [exwp,estdwp]=energymeanstd(10.^(mx/nME:mx/nME:mx),H(:,j-1),10.^(Es));
    entxwp(:,j-1)=exwp;
    entstdwp(:,j-1)=estdwp;
    
    lowedge(1,j-1)=startpt;
    upedge(1,j-1)=endpt;
    delta(1,j-1)=endpt-startpt;
end
 