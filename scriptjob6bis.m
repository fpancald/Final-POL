%mean and std in window as energy maximized with respect to mean energy

for in=n1:n2
    entxwps{in}=zeros(nME,m-1);
    entstdwps{in}=zeros(nME,m-1);
    for j=2:m
        [exwp,estdwp]=energymeanstd(10.^(mx/nME:mx/nME:mx),HH{in}(:,j-1),10.^(Es));
        entxwps{in}(:,j-1)=exwp;
        entstdwps{in}(:,j-1)=estdwp;
    end
end
for in=n3:n4
    entxwps{in}=zeros(nME,m-1);
    entstdwps{in}=zeros(nME,m-1);
    for j=2:m
        [exwp,estdwp]=energymeanstd(10.^(mx/nME:mx/nME:mx),HH{in}(:,j-1),10.^(Es));
        entxwps{in}(:,j-1)=exwp;
        entstdwps{in}(:,j-1)=estdwp;
    end
end
