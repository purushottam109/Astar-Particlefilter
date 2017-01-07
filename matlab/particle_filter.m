% Make librobotics available
addpath('librobotics');

% Read world data, i.e. landmarks
landmarks = read_world('../data/world.dat');

% Read sensor readings, i.e. odometry and range-bearing sensor
data = read_data('../data/sensor_data.dat');

%obstacles = read_world('../data/obstacles.dat');
obstacles = [1 3 5 1;
             2 2.5 2.5 1
             3 7.5 6 1
             4 4 8 0.5
             5 5 4 0.5];


        
         
         
         
         
         
         
         


% Set start and goal
start=[0,0];
goal=[9,7];   

if(~isaccessible(goal,obstacles))
    display('The goal is inaccessible(lies inside the obstacles)');
else
        t=1;
        path= [start];
        robotposes=[];
        
        figure(1);
        
        
        % compute the shortest path using A*
        title(' Astar explores the possible paths strategises the best ');
        disp('Please wait!, it may take some time(step by step visualization is off');
        path =[path; Astar(start,goal,landmarks, obstacles)];
        figure(2);
        
        % draw the shortest path
        title('The shortest path found by the A* algorithm');
        drawshortestpath(landmarks,size(path,1),obstacles, path,goal);
        particles = initialize_particles(1000,[start(1),start(2),0]);
        x= start(1);
        y= start(2);
        theta=0;
        odometry= [];   
        

        figure(3);
        %title('Localization of the robot by the particle filter');

        for t=2:size(path,1) 

            %move the robot and get the poses 
         [x,y,theta] = goTo([x(end),y(end),theta(end)],[path(t,1),path(t,2)]);


        
          robotposes = [robotposes ; x,y,theta];
          
            x2= [x(1);x(end)];
            y2= [y(1);y(end)];
            theta2= [theta(1);theta(end)];
         
          
          index = 2;
          % compute odometry
          trans= sqrt((x2(index)- x2(index-1))^2 + (y2(index)- y2(index-1))^2);
          rot1= atan2(y2(index)- y2(index-1),x2(index)- x2(index-1))- theta2(index-1);
          rot2= theta2(index)- theta2(index-1) - rot1;
            odometry= [rot1, trans, rot2];

            
            
              new_particles = sample_motion_model(odometry, particles);

            % Compute the weights of the new particles using the distance-only sensor
            % model
            weights = measurement_model(data.timestep(t).sensor, new_particles, landmarks);
            
            % Generate visualization plots of the current state of the filter
            plotstate(new_particles, weights, landmarks, t, robotposes, obstacles,'../plots/plotstates/plot_%03d.png',goal);
          
            % Normalize the weights of the particles for stability reasons
            weights = weights ./ sum(weights);

            % Create a new generation of particles by sampling particles from the
            % old set according to their weight.
            particles = resample(new_particles, weights);

         end
        
    
end