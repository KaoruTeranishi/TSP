function [s,s_] = pinktsp(N,a,mode)

%   This function provides Pink-TSP.
%   usage : pinktsp(N), pinktsp(N,a), pinktsp(N,a,'mode'), pinktsp(N,a,'mode','normalize')
%   return : Pink-TSP, Inverse Pink-TSP
%   N : length
%   a : scaling gain (initial value = 1)
%   mode : 'up' -> up-sweep, 'down' -> down-sweep (initial value = 'down')

switch nargin
    case 1
        a = 1;
        mode = 'down';
    case 2
        mode = 'down';
    otherwise
end

switch mode
    case 'down'
        tmp = 1j;
    case 'up'
        tmp = -1j;
    otherwise
        disp('error')
        return
end

k = 1:1:N/2;
m = N/4;
J = 2*m;
alpha = (J*pi)/((N/2)*log(N/2));

S = zeros(1,N);
S(1) = 1;
S(2:N/2+1) = exp(tmp.*alpha.*k.*log(k))./sqrt(k);
S(N/2+2:N) = conj(fliplr(S(2:N/2)));
s = real(ifft(S));

s = s.*a;

if nargout == 2
    S_ = zeros(1,N);
    S_(1) = 1;
    S_(2:N/2+1) = exp(-tmp.*alpha.*k.*log(k)).*sqrt(k);
    S_(N/2+2:N) = conj(fliplr(S_(2:N/2)));
    s_ = real(ifft(S_))./a;
end
