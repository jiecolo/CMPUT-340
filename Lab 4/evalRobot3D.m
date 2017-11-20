function [pos,J]=evalRobot3D(M,theta)
    pos = f(M,theta);
    
    alpha = 0.00001;
    J(:,1) = (f(M,theta+[alpha;0;0;0])-f(M,theta-[alpha;0;0;0]))/(2*alpha);
    J(:,2) = (f(M,theta+[0;alpha;0;0])-f(M,theta-[0;alpha;0;0]))/(2*alpha);
    J(:,3) = (f(M,theta+[0;0;alpha;0])-f(M,theta-[0;0;alpha;0]))/(2*alpha);
    J(:,4) = (f(M,theta+[0;0;0;alpha])-f(M,theta-[0;0;0;alpha]))/(2*alpha);
    
    % discard the homogeneous component
    pos = pos(1:3); 
    J = J(1:3,1:4);
end

function pos=f(M,theta)
    pos = M(1)*Rz(theta(3))*Ry(theta(2))*Rx(theta(1))*M(2)*Rx(theta(4))*M(3)*[0 0 0 1]';
end

function R=Rx(theta)
    R = [1 0 0 0
        0 cos(theta) -sin(theta) 0
        0 sin(theta) cos(theta) 0
        0 0 0 1];
end

function R=Ry(theta)
    R = [cos(theta) 0 sin(theta) 0
        0 1 0 0
        -sin(theta) 0 cos(theta) 0
        0 0 0 1];
end

function R=Rz(theta)
    R = [cos(theta) -sin(theta) 0 0
        sin(theta) cos(theta) 0 0
        0 0 1 0
        0 0 0 1];
end