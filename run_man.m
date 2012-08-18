function tot = run_man(N, viz, alg)

%Initialize grid arrays
a = zeros(N);
b = zeros(N);
z = zeros(N);
c = uint8(zeros(N));

j = 1:N;
J = repmat(j, length(j), 1);
J = J/(N/2) - 1.5;

k = 1:N;
K = repmat(k', 1, length(k));
K = -K/(N/2) + 1;

%Timing and visulization
tot = 0;
step = false; %discrete shading
cont = false; %continous shading
if(viz == 1)
    step = true;
elseif(viz == 2)
    cont = true;
end

%Algorithm
looper = false;
vector = false;
gooper = false;
if(alg == 0)
    looper = true;
elseif(alg == 1)
    vector = true;
elseif(alg == 2)
    gooper = true;
end

%Number of iterations
its = 30;

for it=1:its

    if(vector
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
