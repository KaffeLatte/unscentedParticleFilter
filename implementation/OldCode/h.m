function [ y_predict ] = h( x_value, n, t)

if t <= 30
    y_predict = 0.2 * x_value.^(2) + n;
else
    y_predict = 0.5 * x_value - 2 + n;

end



