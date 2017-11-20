% Initialize
clear;
close all;
addpath /cshome/vis/data;
% Generate a random pose and visualize it
robot3D('new'); % Init OpenGL window
load human_data; % load human joint configs

% load motion data below

%load walk1
%load walk2
%load walk3
%load walk4
%load walk5
%load walk6
load jump1

% Choose some random starting point
% use 2*rand(8,1)-1 if you want a wider range of theta.
%tl = 2*rand(4,1)-1
%tr = 2*rand(4,1)-1
tl = [-pi/8; pi/64; -pi/8; pi/16]
tr = [-pi/8; pi/64; pi/8; pi/16]

for i = 1:size(L,2)
    tl = invKin3D(Ml, tl, L(:,i));
    tr = invKin3D(Mr, tr, R(:,i));
    angles = [tl;tr];
    robot3D(humanInterp(drad,angles)); % Visualize the pose
end