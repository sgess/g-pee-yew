function [a1,b1] = myMandlFun(a,b)
%function [a1,b1] = myMandlFun(a,b,J,K)
%function [a1,b1,c1] = myMandlFun(a,b,c,J,K)
a1 = a * a - b * b;
%a1 = a .* a - b .* b + J./1000 - 1.5;

b1 = 2 * a * b;
%b1 = 2 .* a.* b - K./1000 + 1;

% z = sqrt(a^2 + b^2);

% if z > 2 && c == 0
%     c1 = it;
% else
%     c1 = c;
% end