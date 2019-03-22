function ir = tspCalcARCS(filename,in_col,out_col,a)

%   This function provides a result of OATSP method.
%   You should use this function with your experiments by ARCS.
%   http://www.sidewarehouse.net
%   Input signal length and original OATSP length must be same.
%   usage : tspCalcARCS(filename,in_col,out_col), tspCalcARCS(filename,in_col,out_col,a)
%   return : estimated impulse response
%   filename : csv file name
%   in_col : the column number of the input
%   out_col : the column number of the output
%   a : scaling gain (initial value = 1)

if nargin < 4
    a = 1;
end

data = csvread(filename);
in = data(:,in_col)';
out = data(:,out_col)';
is = fliplr(in)./a;

ir = tspCalc(out,is);