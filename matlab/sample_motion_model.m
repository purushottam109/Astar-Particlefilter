function x_new = sample_motion_model(u, x)
    % Samples new particle poses, based on old poses and the odometry reading
    %
    % u: odometry reading (r1, t, r2)
    % x: M x 3 matrix of old particles, each row representing a single
    %    particle (x, y, theta)
    % x_new: M x 3 matrix with new particles obtaind by propagating the old
    %        particles with the motion model

    % TODO: implement
    
  np = length(x); 
  
  
  
  dr1 = u(1);
  dr2 = u(3);
  dt = u(2);
  
  alpha = [0.1 0.1 0.01 0.01];
  a1 = alpha(1);
  a2 = alpha(2);
  a3 = alpha(3);
  a4 = alpha(4);
  
  %% Calculate variances for error samples

  sr1 = a1*abs(dr1) + a2*abs(dt);
  sr2 = a1*abs(dr2) + a2*abs(dt);
  st  = a3*abs(dt) + a4*abs(dr1+dr2);
  
  noise_r1 = sr1*randn(1,np);
  noise_r2 = sr2*randn(1,np);
  noise_t = st*randn(1,np);
  
  x_new = []; 
  for i=1:np
      dsr1 = dr1 + noise_r1(i);
      dsr2 = dr2 + noise_r2(i);
      dst  = dt  + noise_t(i);
      
      theta = x(i,3);
      x2 = x(i,1) + dst*cos(theta+dsr1);
      y2 = x(i,2) + dst*sin(theta+dsr1);
      theta2 = x(i,3) + dsr1 + dsr2;
      x_new = [x_new; x2 y2 theta2];
  end
  
end
