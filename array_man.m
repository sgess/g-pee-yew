clear all;

a = zeros(2000);
b = zeros(2000);
z = zeros(2000);
c = uint8(zeros(2000));

j = 1:2000;
J = repmat(j, length(j), 1);
J = J/1000 - 1.5;

k = 1:2000;
K = repmat(k', 1, length(k));
K = -K/1000 + 1;

tot = 0;
pause on;

for it=1:30
	tic;
    a_t = a.^2 - b.^2 + J;
    b = 2*a.*b + K;
    a = a_t;
    
    z = sqrt(a.^2 + b.^2);
    
    c = uint8(it*(z > 2 & c == 0)) + c; 
    
    t = toc;
    imagesc(c);
    pause(0.1);
    disp(['Step time is ' num2str(t) ' seconds.']);
    tot = tot + t;
end

%z = sqrt(a.^2 + b.^2);
%imagesc(log(abs(log(z))));



disp(['Total time for 30 steps is ' num2str(tot) ' seconds. Average time is ' num2str(tot/30) ' seconds.']);