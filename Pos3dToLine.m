function profile=Pos3dToLine(positions)
% profile=Pos3dToLine(positions)
%
% This function "uncrincles" a not perfectly linear profile line given by 
% x and y coordinates.
%
% Each point along the profile will have, as x-value, the distance walked
% along straight lines between the 3d positions
%
% INPUT: 
%
% positions     N x 3 matrix containing x, y, z coordinates
% 
%
% OUTPUT:
%
% profile       N x 2 matrix containing x_profile, z coordinates  
%
%
% EXAMPLE:
%
% x=12:20; y=(-1).^(1:length(x)); z=cumsum(rand(length(x),1));
% positions=[x(:),y(:),z(:)];
% profile=Pos3dToLine(positions);
% plot(profile(:,1),profile(:,2),'-o')
%
%
% Last modified by plattner-at-alumni.ethz.ch, 8/31/2017

if size(positions,2) ~= 3
    error('Size of positions vector is wrong.')
end

% For each two consecutive points, calculate the distance
xdists=positions(2:end,1)-positions(1:end-1,1);
ydists=positions(2:end,2)-positions(1:end-1,2);

profile=[cumsum([0;sqrt(xdists.^2+ydists.^2)]),positions(:,3)];


