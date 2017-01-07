function particles = initialize_particles(count,x)
    % Returns a set of randomly initialized particles.
    %
    % Creates "count" particles normally distributed around (0, 0) with
    % a standard deviation of 1.
    % The returned matrix has the dimension count x 3, where each row in
    % the matrix represents the (x, y, theta) values of a single particle.
    particles = [ ...
        x(1) + randn(count, 1), ...
        x(2) + randn(count, 1), ...
        x(3) + (2*pi*rand(count, 1) - pi)
    ];
end
