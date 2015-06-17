cd ..
scriptjob9
mkdir starmut_size_10_15_total_300_50_each_K_5
cd starmut_size_10_15_total_300_50_each_K_5
save('matlab.mat','-v7.3')
cd ..
scriptbysize
cd starmut_size_10_15_total_300_50_each_K_5
save('matlab2.mat','HH','-v7.3')


cd ..
cd starmut_size_10_15_total_300_50_each_K_5
load('matlab.mat')
load('matlab2.mat')
cd ..
scriptjob6
cd starmut_size_10_15_total_300_50_each_K_5
save('matlab3.mat','entxwps','entstdwps')