dLEp=zeros(l,m-2);
for i=3:m
    for j=1:l
        dLEp(j,i-2)=(log10(LE(j,i))-log10(LE(j,i-1)))/(p(i)-p(i-1));
    end
end
% plot((p(2:end-1)+p(3:end))/2,dEp);
hold on
for j=1:1
    plot((p(2:end-1)+p(3:end))/2,dLEp(j,:))
end
plot((p(2:end-1)+p(3:end))/2,log10(-6*((p(2:end-1)+p(3:end))/2).^7))