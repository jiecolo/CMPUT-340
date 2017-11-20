l = [1 1]';
theta = [pi/4 pi/4]';
alpha = 0.1;
[~,x] = evalRobot2D(l,theta)
y = fdJacob2D(l,theta,alpha)

diff = x-y