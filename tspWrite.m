function tspWrite(filename,s)

%   This function provides an OATSP data file.
%   usage : tspWrite(filename,s)
%   return : none
%   filename : output file name
%   s : OATSP data

N = length(s);
fileID = fopen(filename,'w');
fprintf(fileID,'%d\n',N);
for c = 1:N
    fprintf(fileID,'%23.15e\n',s(c));
end
fclose(fileID);