function [ y_predict ] = predictY( x_value, t )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

if t <= 30
    y_predict = 0.2 * x_value.^(2);
else
    y_predict = 0.5 * x_value - 2;
end

