%create random connected topology of size n from zero
function [E]=randtop(n)
E=random('unid',2)-1;
for i=2:n
    E=randplus1node(E);
end
end