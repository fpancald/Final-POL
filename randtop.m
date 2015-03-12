%create random connected topology of size n from zero
function [E]=randtop(n)
E=random('unid',2)-1;
for i=2:n
    E=randplus1node(E);
end
%turn OFF self-loop % comment out to turn ON 
% for i=1:n
%     E(i,i)=0;
% end

end