function [s,s_] = tsp(N,a,mode)

%   This function provides OATSP.
%   usage : tsp(N), tsp(N,a), tsp(N,a,'mode'), tsp(N,a,'mode','normalize')
%   return : OATSP, Inverse OATSP
%   N : length of OATSP
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

% A is the amplitude of OATSP on the frequency domain.
% You cannot change this parameter.
A = 1;
m = N/4;
n_rot = N/2-m;
k = (0:1:N/2);
x = A*exp(4.*m.*pi.*k.*k.*1j./(N*N));

S = zeros(1,N);
S(1:N/2+1) = x;
S(N/2+2:N) = conj(fliplr(S(2:N/2)));

tmp = real(ifft(S));
s(N-n_rot+1:N) = tmp(1:n_rot);
s(1:N-n_rot) = tmp(n_rot+1:N);

switch mode
    case 'down'
        s = s.*a;
    case 'up'
        s = fliplr(s).*a;
    otherwise
        disp('error')
        return
end

if nargout == 2
    s_ = fliplr(s);
    s_ = s_./(a^2);
end
