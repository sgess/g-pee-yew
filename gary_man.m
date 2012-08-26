function [z_out,c_out,tot] = gary_man(a,b,z,c,J,K,its)

a_g = gpuArray(a);
b_g = gpuArray(b);
c_g = gpuArray(c);
z_g = gpuArray(z);
J_g = gpuArray(J);
K_g = gpuArray(K);

tot = zeros(1,its);
for it=1:its
    tic;
    [a_g,b_g,z_g] = arrayfun(@myMandlFun,a_g,b_g,J_g,K_g);
    c_g = uint8(it*(z_g > 2 & c_g == 0)) + c_g;
    tot(it) = toc;
end

z_out = gather(z_g);
c_out = gather(z_c);