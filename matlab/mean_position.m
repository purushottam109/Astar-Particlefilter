function mean_pos = mean_position(particles, weights)
    % Returns a single estimate of filter state (x, y, theta) based
    % on the particle cloud.
    %
    % particles: matrix of dimension M x 3 representing the particles
    % weights: vector of dimension M x 1 containing the particle weights
    % mean_pos: 3 x 1 vector with the estimate of the filter state / pose

    % TODO: implement
    mean_pos = mean(particles);
    
end
