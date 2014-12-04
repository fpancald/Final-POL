clear all
n=20;
p=0.9;
Es=zeros(n,length(p));
El=zeros(n,length(p));
for i=2:n
    for j=1:length(p)
        Es(i,j)=(i-1+p(j))/p(j);
        for k=0:i-1
            El(i,j)=El(i,j)+p(j)^k;
        end
        El(i,j)=El(i,j)/p(j)^i-1;
    end
end
for j=1:length(p)
    hold on
    figure(j)
    plot(2:n,Es(2:n,j),'Color','r');
    plot(2:n,El(2:n,j));
    xlabel('Number of nodes N')
    ylabel('Critical energy E*')
    title('Critical energy for the star(red) and the line(blue)')
end

%  for j=1:length(p)
%     figure(j+length(p))
%     
% end  