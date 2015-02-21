function [T]=randsettopsizes(s1,s2,N)
ss1=min(s1,s2);
ss2=max(s1,s2);
T=[];
for i=ss1:ss2
    T=[T,randsettopsize(i,N)];
end
end