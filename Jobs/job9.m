% cd ..
% scriptjob9
% mkdir starmut_size_15_20_total_300_50_each
% cd starmut_size_15_20_total_300_50_each
% save('matlab.mat','-v7.3')
% cd ..
% scriptbysize
% cd starmut_size_15_20_total_300_50_each
% save('matlab2.mat','HH','-v7.3')


cd ..
cd starmut_size_15_20_total_300_50_each
load('matlab.mat')
load('matlab2.mat')
cd ..
scriptjob6
cd starmut_size_15_20_total_300_50_each
save('matlab3.mat','entxwps','entstdwps')