function value=connpump(A)
list=1;
nodes=2:length(A);
for i=nodes
    for elm=list
        if A(elm,i)==1 && sum(nodes==i)~=0 ;
            nodes=nodes(nodes~=i);
            list=[list,i];
%             i
        end
    end
end
value=isempty(nodes);
end

% test
% T=randsettopsize(10,500);
% for i=1:length(T)
% value(i)=connpump(T{i});
% end
% sum(value==0)