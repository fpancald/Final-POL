clear all
n=50;
c=1;

p=1;
psum=0;
for l=1:n-1
    psum=psum+p^(l-1);
    s=n-l;
    E(l)=c*(s*psum+p^l)/p^l;
end
figure(1)
plot(1:n-1,E);
xlabel('parameter l','FontSize',20)
ylabel('Critical energy E*','FontSize',20)
title('Critical energy for flares of size n=50','FontSize',20)
hold on

p=0.96;
psum=0;
for l=1:n-1
    psum=psum+p^(l-1);
    s=n-l;
    E(l)=c*(s*psum+p^l)/p^l;
end

plot(1:n-1,E,'Color','r');

p=0.94;
psum=0;
for l=1:n-1
    psum=psum+p^(l-1);
    s=n-l;
    E(l)=c*(s*psum+p^l)/p^l;
end

plot(1:n-1,E,'Color','g');
h_legend=legend('p=1','p=0.96','p=0.94');
set(h_legend,'FontSize',14);