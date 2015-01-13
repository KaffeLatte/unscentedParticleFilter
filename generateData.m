function [xt, yt] = generateData(t_max)

phi1 = 0.5;
phi2 = 0.2;
phi3 = 0.5;
omega = 4*exp(1)-2;

x0 = 1; % TODO : change to random value.
xt = [x0];
yt = [getCurrentY(xt(1), 0, phi2, phi3, normrnd(0,0.00001))];

for t=1:t_max
    current_x = getCurrentX(xt(t), t, phi1, omega, gamrnd(3,2));

    xt = [xt; current_x];
    current_y = getCurrentY(xt(t), t, phi2, phi3, normrnd(0,0.00001));
    yt = [yt; current_y];
end  

end

