function weight = measurement_model(z, x, l)
    % Computes the weights of all particles.
    %
    % The employed sensor model is range only.
    %
    % z: structure containing the landmark observations, see
    %    read_data for the format
    % x: matrix of dimension M x 3 containing the current particles, each
    %    row repersents a single particle (x, y, theta)
    % l: structure containing the landmark position and ids, see
    %    read_world for the format
    % weight: M x 1 vector with particle weights computed with by the
    %         distance-only sensor model
   
    %Complete the file measurement model.m by implementing the sensor model of a distance-only
    %sensor with measurement standard deviation σ = 0.2. Use matrix operations where possible.
    %Instead of computing a probability it is sufficient to compute the likelihood p(z|x, l)

    % Sensor readings can again be indexed and each of the entris has the
    % following fields:
    % - id      : id of the observed landmark
    % - range   : measured range to the landmark
    % - bearing : measured angle to the landmark (you can ignore this)
    %
    % Examples:
    % - Translational component of the odometry reading at timestep 10
    %   data.timestep(10).odometry.t
    % - Measured range to the second landmark observed at timestep 4
    %   data.timestep(4).sensor(2).range
    
    % Each landmark contains the following information:
    % - id : id of the landmark
    % - x  : x-coordinate
    % - y  : y-coordinate
    %
    % Examples:
    % - Obtain x-coordinate of the 5-th landmark
    %   landmarks(5).x
    
    sigma = 0.2
    %sigma = 1.5
    
    weight = zeros(1,500);
    
    length(z)
    length(x)
    length(l)
    
    %for each particle
    for(i = 1:length(x))
        
        x_coord = x(i, 1);
        y_coord = x(i, 2);
        theta_coord = x(i,3);
        %pause
        
        totalWeight = 1;
        
        %for each landmark
        for(j = 1:length(l))
            
            landmark_x = double( l(j).x );
            landmark_y = double( l(j).y );
            %pause
            
            dHat = sqrt((landmark_x - x_coord)^2 + (landmark_y - y_coord)^2);
            %%%%%%%%
            %thetaHat = atan2((landmark_y - y_coord),(landmark_x - x_coord))- theta_coord;

            
            
            
            
            %for each landmark observation from z
            for(k = 1:length(z))
                
                landmark_id = z(k).id;
                range = z(k).range;
                %bearing= z(k).bearing;
                %pause
                
                
                %compute probability for each landmark and multiply them
                %together
                
                pDet = normpdf(range - dHat, 0, sigma);
                %pDet = normpdf(range - dHat, 0, sigma)*normpdf(bearing - thetaHat, 0, sigma) ;

                if landmark_id == j
                  totalWeight = double(totalWeight) * double(pDet);
                end
            end
            
        end
   
        weight(i) = double ( totalWeight ); 
    end
end
    
