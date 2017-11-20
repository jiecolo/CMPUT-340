function theta=invKin3D(M,theta,pos)
    % Newton's Method
    for i=1:652
        [f,J] = evalRobot3D(M,theta);
        s = J\-(f-pos);
        theta = theta+s;
            
        if abs(norm(pos-f)) < 0.00001
            break
        end
    end
end