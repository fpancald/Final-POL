close all
clear all
clc
format long
p=0.0001:.0001:.01;

k=1:100;

for i=1:100
    for j=1:100
        pkStar(i,j) =p(i)^(k(j)-2)*(1-p(i))*(p(i)+k(j));
        pkLine(i,j) = 1-p(i)^k(j);
    end
end
result=pkStar - pkLine;
% for i=1:100
%     for j=1:100
%         if pkStar(i,j) - pkLine(i,j) < 0
%             result(i,j) = 30;
%         else
%             result(i,j) = 0;
%         end
%         
%     end
% end
surf(p,k,result)
% figure
% image(p,k,result)