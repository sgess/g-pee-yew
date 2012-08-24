function [z_out,c_out,tot] = loop_man(a,b,z,c,N,edgeX,edgeY,its)

tot = zeros(1,its);

for it=1:its
    tic;
    for j=1:N
        for k=1:N
            a_cur = a(j,k);
            b_cur = b(j,k);
            a(j,k) = (a_cur^2 - b_cur^2) + (j/(N/2) + edgeX);
            b(j,k) = 2*a_cur*b_cur + (-k/(N/2) + edgeY);
            
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