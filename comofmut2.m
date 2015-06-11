Nmin=2;
Nmax=47;
Kmax=10;
P=zeros(Kmax,Nmax-Nmin+1);
LegendK=cell(Kmax,1);
for K=1:Kmax
    LegendK{K}=[' K= ' num2str(K)] ;
    for N=Nmin:Nmax;
        k=floor((N^2-N)/K);
        P(K,N-Nmin+1)=1- nchoosek(N,0)*nchoosek(N^2-N,k)/nchoosek(N^2,k);
    %     k=N/K;
    %     P(K,N-Nmin+1)=1- nchoosek(N,0)*nchoosek(N^2-N,k)/nchoosek(N^2,k);
    end
end



figure(1)
plot(Nmin:Nmax,P')
legend(LegendK);
xlabel('N topology size','FontSize',20)
ylabel('P probability','FontSize',20)
title('Probabilty of at least one non-neutral mutation, k=[(N^2-N)/K] (k =#mutations)','FontSize',16)

Nmin=2;
Nmax=47;
Kmax=8;
P=zeros(Kmax,Nmax-Nmin+1);
LegendK=cell(Kmax-1,1);
for K=2:Kmax
    LegendK{K-1}=[' K= ' num2str(K)] ;
    for N=Nmin:Nmax;
        k=floor((N^2)/K);
        P(K,N-Nmin+1)=1- nchoosek(N,0)*nchoosek(N^2-N,k)/nchoosek(N^2,k);
    %     k=N/K;
    %     P(K,N-Nmin+1)=1- nchoosek(N,0)*nchoosek(N^2-N,k)/nchoosek(N^2,k);
    end
end



figure(2)
plot(Nmin:Nmax,P(2:Kmax,:)')
legend(LegendK);
xlabel('N topology size','FontSize',20)
ylabel('P probability','FontSize',20)
title('Probabilty of at least one non-neutral mutation, k=[N^2/K] (k =#mutations)','FontSize',16)