kmax=10;
% k=1:kmax;
Nmin=ceil((1+sqrt(1+4*kmax))/2);
Nmax=24;
% N=Nmin:Nmax;
P=zeros(kmax,Nmax-Nmin+1);
Legendk=cell(kmax,1);
LegendN=cell(Nmax-Nmin+1,1);
for k=1:kmax
    
     
    Legendk{k}=['k = ' num2str(k)] ;
    
    for N=Nmin:Nmax;
        if k==1
             
            LegendN{N-Nmin+1}=['N = ' num2str(N)] ;
        end
        P(k,N-Nmin+1)=1- nchoosek(N,0)*nchoosek(N^2-N,k)/nchoosek(N^2,k);
    end
end


set(0,'DefaultAxesLineStyleOrder',{'-','--',':'})
figure(1)
plot(1:kmax,P)
legend(LegendN);
xlabel('k number of mutations','FontSize',20)
ylabel('P probability','FontSize',20)
title('Probabilty of at least one non-neutral mutation, k variable N fixed','FontSize',16)

figure(2)
plot(Nmin:Nmax,P')
legend(Legendk);
xlabel('N topology size','FontSize',20)
ylabel('P probability','FontSize',20)
title('Probabilty of at least one non-neutral mutation, k fixed variable N','FontSize',16)