cd ..
scriptjob18
mkdir starmut_size_5_5_50_total_500_50_eachK8
cd starmut_size_5_5_50_total_500_50_eachK8
save('matlab.mat','-v7.3')
cd ..
scriptbysizenew
cd starmut_size_5_5_50_total_500_50_eachK8
save('matlab2.mat','HH','-v7.3')

cd ..
scriptjob6new
cd starmut_size_5_5_50_total_500_50_eachK8
save('matlab3.mat','entxwps','entstdwps')