function ir = tspCalc(y,is)

%   This function provides a calculation of estimating impulse response using OATSP.
%   usage : tspCalc(y,is)
%   return : estimated impulse response
%   y : the output when OATSP inputs to the plant
%   is : inverse OATSP

N = length(is);
ir = conv(y,is);
figure;
plot(ir);
ir = ir(N:2*N-1);
