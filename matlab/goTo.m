
function [x,y,theta] = goTo(x0, xg)
%goTo() simulates the robots motion reaching the goal.
%INPUT  the initial pose and goal's coordinates
%OUTPUT return resulting path as three vectors each 1 × n long where n is the
%       number of time steps
krho = 3;
kalpha = 8;
kbeta = -1.5;

x = [];
y = [];
theta = []; 

error = sqrt((xg(1)-x0(1)).^2 + (xg(2) - x0(2)).^2);

while(error > 0.005)
    disp(error);
    [velocity, omega] = control(krho, kalpha, kbeta, x0, xg);

    [pathx, pathy, paththeta] = diffDrive([x0(1), x0(2), x0(3)], velocity, omega, 2, 0.05);
    x0(1) = pathx(end);
    x0(2) = pathy(end);
    x0(3) = paththeta(end);
    x = [x; pathx];
    y = [y; pathy];
    theta = [theta; paththeta];
    error = sqrt((xg(1)-x0(1)).^2 + (xg(2) - x0(2)).^2); 
 
end    


function [v, omega]= control(krho, kalpha, kbeta, x0, xg)
% control() computes the control law for the robots current pose
% INPUT     values of k?, k?, k?,the robots pose and goal's coordinates 
% OUTPUT    linear velocity v and angular velocity omega  
rho = sqrt((xg(1)-x0(1)).^2 + (xg(2) - x0(2)).^2);

alpha = - x0(3) + atan2((xg(2) - x0(2)),(xg(1) - x0(1)));
beta =  - x0(3) - alpha;    

v = krho * rho;
omega = kalpha*alpha + kbeta*beta;

function [x, y, theta] = diffDrive(E0, v, omega, timesteps, delta)
% diffDrive() simulates the motion of the robot for given number of timesteps
% INPUT       initial pose vector E0, linear velocity v, angulare velocity
%             omega, number of time steps timesteps and the length of each
%             time step delta
%OUTPUT       return resulting path as three vectors each 1 × n long where n is the
%             number of time steps
    x = E0(1);
    y = E0(2);
    theta = E0(3);
    for i = 2 : timesteps
        x(i,:) = x(i - 1) + v*delta*cos(theta(i-1));
        y(i,:) = y(i - 1) + v*delta*sin(theta(i-1));
        theta(i,:) = theta(i - 1) + omega*delta;
    end