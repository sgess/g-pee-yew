function time = run_man(N, edgeX, edgeY, its, alg, viz)

if nargin == 5
    viz=false;
elseif nargin == 4
    alg=0;
elseif nargin < 4
    error('Must define grid and number of iterations.');
end

%Initialize grid arrays
a = zeros(N);
b = zeros(N);
z = zeros(N);
c = uint8(zeros(N));

j = 1:N;
J = repmat(j, length(j), 1);
J = J/(N/2) + edgeX;

k = 1:N;
K = repmat(k', 1, length(k));
K = -K/(N/2) + edgeY;

%Algorithm
if(alg == 0)
    [z,c,tot] = loop_man(a,b,z,c,J,K,its);
elseif(alg == 1)
    [z,c,tot] = vect_man(a,b,z,c,J,K,its);
elseif(alg == 2)
    [z,c,tot] = arry_man(a,b,z,c,J,K,its);
end

if viz
    imagesc(c);
    %imagesc(log(abs(log(z))));
    colorbar;
    %saveas(gcf,'man.pdf');
end

time = sum(tot);

disp(['Total time for ' num2str(its) ' steps is ' num2str(time) ' seconds. Average time is ' num2str(mean(tot)) ' seconds.']);
