function [a1,b1,z] = myMandlFun(a,b,J,K)

a1 = a .* a - b .* b + J;
b1 = 2 .* a .* b + K;

z = sqrt(a.^2 + b.^2);