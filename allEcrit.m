function [E]=allEcrit(A,c,p)
format long
n=length(A);
E=[];
for i=2:n
    E=[E;ecrit(A,i,c,p)];
end
E=flipud(sort(unique(E)));
end