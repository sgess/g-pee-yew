function [z_out,c_out,tot] = vect_man(a,b,z,c,J,K,its)

tot = zeros(1,its);

for it=1:its
    tic;
    
    a_t = a.^2 - b.^2 + J;
    b = 2*a.*b + K;
    a = a_t;
    
    z = sqrt(a.^2 + b.^2);
    
    c = uint8(it*(z > 2 & c == 0)) + c; 
    
    tot(it) = toc;
end

z_out = z;
c_out = c;