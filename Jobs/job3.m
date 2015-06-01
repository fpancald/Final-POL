% cd ..
% scriptjob3
% cd rand_size_5_15_total_550_50_each
% save('matlab.mat','-v7.3')
% cd ..
% scriptbysize
% cd rand_size_5_15_total_550_50_each
% save('matlab2.mat','HH','-v7.3')

cd ..
cd rand_size_5_15_total_550_50_each
load('matlab.mat')
cd ..
scriptbysize
cd rand_size_5_15_total_550_50_each
save('matlab2.mat','HH','-v7.3')