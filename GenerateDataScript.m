% Generate data
clear all
clc
close all
t_max = 60;

[xt,yt] = generateData(t_max);


%% Visualize generated data
ts = 1:61;
figure
subplot(1,2,1)
plot(ts,xt)
title('xt')
subplot(1,2,2)
plot(ts,yt)
title('yt')

 
