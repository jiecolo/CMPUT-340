function J=fdJacob2D(l,theta,alpha)
    J(:,1) = (evalRobot2D(l,theta+[alpha;0])-evalRobot2D(l,theta-[alpha;0]))/(2*alpha);
    J(:,2) = (evalRobot2D(l,theta+[0;alpha])-evalRobot2D(l,theta-[0;alpha]))/(2*alpha);
end