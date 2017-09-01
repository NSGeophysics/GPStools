function downsampleTopo(fname,factor,outname)
% downsampleTopo(fname,factor,outname)
%
% Reads the ASCII file obtained from opentopo.sdsc.edu and saves every n-th
% point (n=factor) to variables x,y,z
% 
% INPUT:
%
% fname     name of data file, for example points.txt
% factor    downsampling factor (for example: only use every 100th point
%            -> factor=100)
% outname   name for the mat file in which you want to save the downsampled
%           data
%
% Last modified by plattner-at-alumni.ethz.ch, 10/26/2016

% Read the data points
dat=importdata(fname);

% The points are read into the struct dat. The struct has some variables,
% including the variable data, which contains x,y,z coordinates and more.
% We only want the x, y, and z coordinates wich are the first three
% columns. Open the file fname yoursel to see.
x=dat.data(1:factor:end,1);
y=dat.data(1:factor:end,2);
z=dat.data(1:factor:end,3);

% Now save the downsampled data in a .mat file
save(outname,'x','y','z');

