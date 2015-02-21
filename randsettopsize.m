function [T]=randsettopsize(s,N)
T=[];
for i=1:N
    T{i}=randtop(s);
end
end