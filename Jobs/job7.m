% cd ..
% scriptjob7
% mkdir rand_size_11_15_and_31_35_total_500_50_each
% cd rand_size_11_15_and_31_35_total_500_50_each
% save('matlab.mat','-v7.3')
% cd ..
% scriptbysize2
% cd rand_size_11_15_and_31_35_total_500_50_each
% save('matlab2.mat','HH','-v7.3')

% cd ..
% cd rand_size_11_15_and_31_35_total_500_50_each
% load('matlab.mat')
% cd ..
% scriptbysize2
% cd rand_size_11_15_and_31_35_total_500_50_each
% save('matlab2.mat','HH','-v7.3')


cd ..
cd rand_size_11_15_and_31_35_total_500_50_each
load('matlab.mat')
load('matlab2.mat')
cd ..
scriptjob6bis
cd rand_size_11_15_and_31_35_total_500_50_each
save('matlab3.mat','entxwps','entstdwps')