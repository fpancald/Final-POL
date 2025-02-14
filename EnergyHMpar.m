%EnergyHM is a function that provides many plots and data outputs on the
%set ot topologies T given as an input with respect to a specific critical
%energy Ek (determined through the parameter k), the cost per cell c and
%the transport portion p (p can be a vector with values in ascending
%order).

%Inputs:    T: set of topologies
%           k: index of desired critical energy
%           c: constant cell energy cost
%           p: transport fraction (p can be a vector with values in ascending order)

%Outputs:   H: provides for each point on the grid x-axis=p, y-axis=Energy the
%               number of surviving topologies at that grid point (used to get complete
%               colormap)
%           subH: is the same as H but if the value at the point is >0 and
%               <l (total number of topologies) we redefine the value as l/2
%               this gives us a subcolormap with only 3 regions (no
%               survivor, "evolvability window", and total survivor)
%           E: is a matrix of critical energies Ek (each row corresponds to a topology
%               in T and each column to a value of p)
%           LE: is log10 version of E (needed for plotting purpose)
%
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
function [LE]=EnergyHMpar(T,k,c,p)
warning('off','MATLAB:singularMatrix');         %turn off warnings for singular
warning('off','MATLAB:nearlySingularMatrix');   %and nearly singular matrices happens when p close to 0 (is expected)
delete(gcp);
poolobj=parpool('local',2);


l=length(T);
E=[];

%compute the energy matrix E line by line through function EnergyMatrix
parfor i=1:l
    warning('off','MATLAB:singularMatrix');         %turn off warnings for singular
    warning('off','MATLAB:nearlySingularMatrix');   %and nearly singular matrices happens when p close to 0 (is expected)
    n=length(T{i});
    E=[E ; EnergyMatrix(T{i},k,c,p)];
end

m=length(p);

mx=log10(max(max((E(:,2:end))')));      %determine if visualize all the energies in E on y-axis (max-max) or troncate at the minimum one for the smallest non-zero p value
%mx=log10(min(max((E(:,2:end))')));     % (min-max). We take the max only on non-zero p values (2:end)

Es=0:mx/(10*(m-1)):mx;                  %the log10 energy axis grid is taken 10 times finer than the p grid (can be changed in the future)
LE=log10(E);
clear E;
mm=length(Es);
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

%plot colormap based on H,p and Es
figure(1)
colormap('jet')
imagesc(p(2:end),Es(2:end),H)
set(gca,'YDir','normal')
colorbar
% 
% %compute other outputs and plot p-cross sections of H
% delta=[];
% lowedge=[];
% upedge=[];
% xp=[];
% sp=[];
% xwp=[];
% swp=[];
% k=2;
% lb=0.0*l;
% ub=1.0*l;
% plotstep=500;   %plot step for the p-cross section of H
% subH=H;
% for j=2:m
%     xp=[xp mean(H(:,j-1))];
%     sp=[sp std(H(:,j-1))];
%     Hwp=H(:,j-1);
%     Hwp=Hwp(Hwp>lb);
%     Hwp=Hwp(Hwp<ub);
%     xwp=[xwp mean(Hwp)];
%     swp=[swp std(Hwp)];
%     startpt=0;
%     endpt=mx;
%     for i=2:mm
%         if startpt==0
%             if H(i-1,j-1)>lb
%                 startpt=Es(i);
%                 
%             end
%         end
%         if endpt==mx
%             if H(i-1,j-1)>=ub
%                 endpt=Es(i-1);
%                 
%             end
%         end
%         %computes subH
%         if H(i-1,j-1)>lb && H(i-1,j-1)<ub
%             subH(i-1,j-1)=l/2;
%         elseif H(i-1,j-1)<=lb
%                 subH(i-1,j-1)=lb;
%         elseif H(i-1,j-1)>=ub
%                 subH(i-1,j-1)=ub;
%         end
%     end
%     lowedge=[lowedge startpt];
%     upedge=[upedge endpt];
%     delta=[delta (endpt-startpt)];
%     if mod(j,plotstep)==1
%         figure(k)
%         plot(Es(2:end),H(:,j-1));
%         title(num2str(p(j)));
%         k=k+1;
%     end
% end
% 
% warning('on','MATLAB:singularMatrix');          %turn on again warnings 
% warning('on','MATLAB:nearlySingularMatrix');
% 
% %plot remaining ouputs
% figure(k)
% plot(p(2:end),delta);
% figure(k+1)
% plot(p(2:end),lowedge);
% hold on
% plot(p(2:end),upedge);
% hold off
% figure(k+2)
% plot(p(2:end),xp);
% figure(k+3)
% plot(p(2:end),sp);
% figure(k+4)
% plot(p(2:end),xwp);
% figure(k+5)
% plot(p(2:end),swp);
% 
% %plot colormap based on subH
% figure(k+6)
% colormap('jet')
% imagesc(p(2:end),Es(2:end),subH)
% set(gca,'YDir','normal')
% colorbar

delete(poolobj);
end