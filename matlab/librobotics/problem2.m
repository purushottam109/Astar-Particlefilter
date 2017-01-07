function problem2()
hold off
[x,y,theta] = goTo([0,-50,0],[0,0]);
plot(x,y);


hold on
[x,y,theta] = goTo([-50,-5,0],[0,0]);
plot(x,y);

hold on
[x,y,theta] = goTo([0,50,0],[0,0]);
plot(x,y);

  print('-djpeg', '-r45', 'file.jpg');

function [totalpath_x,totalpath_y,totalpath_theta] = goTo(x0, xg)
kp = 3;
kalpha = 8;
kbeta = -1.5;

distance = sqrt((xg(1)-x0(1)).^2 + (xg(2) - x0(2)).^2); 
totalpath_x = [];
totalpath_y = [];
totalpath_theta = 45;

while(distance > 0.1)
    distance
[linear_v, angular_v] = calculate_v(kp, kalpha, kbeta, x0, xg);

 [x_path, y_path, theta_path] = diffDrive(x0(1), x0(2), x0(3), linear_v, angular_v, 2, 0.05);
 x0(1) = x_path(end);
 x0(2) = y_path(end);
 x0(3) = theta_path(end);
 totalpath_x = [totalpath_x, x_path];
 totalpath_y = [totalpath_y, y_path];
 totalpath_theta = [totalpath_theta, theta_path];
 
distance = sqrt((xg(1)-x0(1)).^2 + (xg(2) - x0(2)).^2); 
 
end    


function [linear_v, angular_v]= calculate_v(kp, kalpha, kbeta, x0, xg)
distance = sqrt((xg(1)-x0(1)).^2 + (xg(2) - x0(2)).^2);

alphaval = atan2((xg(2) - x0(2)),(xg(1) - x0(1)));
alphaval = - x0(3) + alphaval;
beta =  - x0(3) - alphaval;    

linear_v = kp * distance;
angular_v = kalpha*alphaval + kbeta*beta;

function [pos_x, pos_y, pos_theta] = diffDrive(x0, y0, theta0, v, omega, timesteps, delta)
    pos_x = x0;
    pos_y = y0;
    pos_theta = theta0;
    for i = 2 : timesteps
        prev_x = pos_x(i - 1);
        prev_y = pos_y(i - 1);
        theta = pos_theta(i - 1);
        pos_x(i) = prev_x + v*delta*cos(theta);
        pos_y(i) = prev_y + v*delta*sin(theta);
        pos_theta(i) = theta + omega*delta;
    end