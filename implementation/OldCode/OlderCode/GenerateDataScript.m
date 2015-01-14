% Generate data
clear all
clc
close all
t_max = 60;
x0 = 1; % TODO : change to random value.
[xt,yt] = generateData(t_max, x0);


%% Visualize generated data
ts_x = 1:61;
ts_y = 1:60;
figure
subplot(1,2,1)
plot(ts_x,xt,'o')
title('xt')
subplot(1,2,2)
plot(ts_y,yt,'*')
title('yt')

 
