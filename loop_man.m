function [z_out,c_out,tot] = loop_man(a,b,z,c,J,K,its)

tot = zeros(1,its);

for it=1:its
    tic;
    for j=1:length(J)
        for k=1:length(K)
            a_cur = a(j,k);
            b_cur = b(j,k);
            a(j,k) = (a_cur^2 - b_cur^2) + J(j,k);
            b(j,k) = 2*a_cur*b_cur + K(j,k);
            
            z(j,k) = sqrt(a(j,k)^2 + b(j,k)^2);
            
            if z(j,k) > 2 && c(j,k) == 0
                c(j,k) = it;
            end
        end
    end
    tot(it) = toc;
end

z_out = z;
c_out = c;