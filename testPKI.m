clear all 
close all 
clc
k=100;

p=.001:.001:1;
% i=2:k-1;
i=2:k-1;
for j=1:length(p)
    for m=1:length(i)
        pLine(m,j)=(1-p(j)^(i(m)))/((1-p(j))*p(j)^(i(m)-1));
        pStar(m,j)=(p(j)+k-1)/p(j);
    end
end

result = pLine-pStar;

isNegative =result < 0;

isNegative =isNegative*30;
image(isNegative)
% hold on
% for m=1:length(p)
%     
%     plot(i,result(:,m))
%     pause(2)
% end
    