function z = vect_man(a,b,J,K,its)

for it=1:its
    a_t = a.^2 - b.^2 + J;
    b = 2*a.*b + K;
    a = a_t;
    
    z = sqrt(a.^2 + b.^2);
    
    c = uint8(it*(z > 2 & c == 0)) + c; 

end