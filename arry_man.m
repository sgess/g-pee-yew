function [z_out,c_out,tot] = arry_man(a,b,z,c,J,K,its)

tot = zeros(1,its);
for it=1:its
    tic;
    [a,b,z] = arrayfun(@myMandlFun,a,b,J,K);
    c = uint8(it*(z > 2 & c == 0)) + c;
    tot(it) = toc;
end

z_out = z;
c_out = c;