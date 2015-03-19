function [NdE]=energyder(N,dE)
l=length(N);
NdE=zeros(l,1);
for i=1:l
    if i==1
        NdE(i)=(N(i)-0)/dE;
    else
        NdE(i)=(N(i)-N(i-1))/dE;
    end
end

end
