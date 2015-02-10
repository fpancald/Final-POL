%builds all topologies up to size n. Works calling recursiveli topelit with
%all the possible star cores up to size n
function [T]=topelitall(n)
T=[];
for i=2:n
    A=[0 ones(1,i-1);zeros(i-1,i)];
    T=[T topelit(A,n)];
%     length(T)
end
end
