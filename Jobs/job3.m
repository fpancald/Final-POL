% cd ..
% scriptjob3
% mkdir rand_size_10_20_total_550_50_each
% cd rand_size_10_20_total_550_50_each
% save('matlab.mat','-v7.3')
% cd ..
% scriptbysize
% cd rand_size_10_20_total_550_50_each
% save('matlab2.mat','HH','-v7.3')


cd ..
cd rand_size_10_20_total_550_50_each
load('matlab.mat')
load('matlab2.mat')
cd ..
scriptjob6
cd rand_size_10_20_total_550_50_each
save('matlab3.mat','entxwps','entstdwps')
