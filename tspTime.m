function tspTime(n,N,mode)

%   This function provides computation time of OATSP.
%   usage : tspTime(n,N), tspTime(n,N,'Calc')
%   return : none
%   n : number of calculations
%   N : length of OATSP

time = zeros(1,n);

if nargin == 3 && strcmp(mode,'Calc')
    [s,s_] = tsp(N);
    for c = 1:n
        tic;
        imp = tspCalc(s,s_);
        time(c) = toc;
        clear imp;
    end
elseif nargin == 2
    for c = 1:n
        tic;
        s = tsp(N);
        time(c) = toc;
        clear s;
    end
else
    disp('err');
end

disp(['ave: ',num2str(mean(time))]);
disp(['var: ',num2str(var(time))]);
disp(['std: ',num2str(std(time))]);
disp(['med: ',num2str(median(time))]);
disp(['max: ',num2str(max(time))]);
disp(['min: ',num2str(min(time))]);
figure;
plot(time,'.','MarkerSize',20);
grid on;