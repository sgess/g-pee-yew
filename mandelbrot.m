clear all;

a = zeros(2000);
b = zeros(2000);
c = uint8(zeros(2000));

z = zeros(2000);

tot = 0;

pause on;
%colormap('bone');
for i=1:30
    tic;
    for j=1:length(a)
        for k=1:length(b)
            a_cur = a(j,k);
            b_cur = b(j,k);
            a(j,k) = (a_cur^2 - b_cur^2) + (j/1000 - 1.5);
            b(j,k) = 2*a_cur*b_cur + (-k/1000 + 1.);
            
            z(j,k) = sqrt(a(j,k)^2 + b(j,k)^2);
            
            %if z > 2 && c(j,k) == 0
            %    c(j,k) = i;
            %end
        end
    end
    toc;
    imagesc(log(abs(log(z))));
    %colorbar;
    title(['Iteration ' num2str(i) ' took ' num2str(toc) ' seconds.']);
    tot = tot + toc;
    pause(0.1);
end

disp(['Total time for 30 steps is ' num2str(tot) ' seconds. Average time is ' num2str(tot/30) ' seconds.']);

pause off;
    