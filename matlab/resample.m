function new_particles = resample(particles, weights)
    % Returns a new set of particles obtained by performing
    % stochastic universal sampling.
    %
    % particles: M x 3 matrix of particles, each row representing a single
    %            particle (x, y, theta)
    % weights: M x 1 vector with the particle weigths
    % new_particles: M x 3 matrix with the resampled particles

    % TODO: implement
    % loop to generate M new points
    
    M = size(particles,1); 
    w = weights/sum(weights);
    
    for i=1:M

        % initialize
        p = 1;
        v = 0;
        t = rand;
        
        % select the sample corresponding to the chosen random value t
        for j=1:M
            v = v + w(j);
            if v >= t
                p = j;
                break; 
            end
        end
        
        % save the value that was picked
        new_particles(i,:) = particles(p,:);
    
    end
    
end
