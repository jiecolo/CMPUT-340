function theta=invKin2D(l,theta0,pos,n,mode)
    theta = theta0;
    if mode == 0    % Newton's Method
        alpha = 0.00001;
        for i=1:n
            J = fdJacob2D(l,theta,alpha);
            [f,~] = evalRobot2D(l,theta);
            s = J\-(f-pos);
            theta = theta+s;
            
            if abs(norm(pos-f)) < 0.00001
                break
            end
        end
    elseif mode == 1    % Broyden's Method
        [f,B] = evalRobot2D(l,theta);
        for i=1:n
            s = B\-(f-pos);
            theta_new = theta+s;
            [f_new,~] = evalRobot2D(l,theta_new);
            y = f_new - f;
            B = B + ((y - B*s)*s')/(s'*s);
            theta = theta_new;
            f = f_new;
            
            if abs(norm(pos-f)) < 0.00001
                break
            end
        end
    end
end