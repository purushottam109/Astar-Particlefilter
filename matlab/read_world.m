function landmarks = read_world(filename)
    % Reads the world definition and returns a structure of landmarks.
    %
    % filename: path of the file to load
    % landmarks: structure containing the parsed information
    % 
    % Each landmark contains the following information:
    % - id : id of the landmark
    % - x  : x-coordinate
    % - y  : y-coordinate
    %
    % Examples:
    % - Obtain x-coordinate of the 5-th landmark
    %   landmarks(5).x
    input = fopen(filename);


    landmarks = struct('id', 0, 'x', 0, 'y', 0);
    i = 1;
    while(~feof(input))
        line = fgetl(input);
        data = textscan(line, '%d %d %d');

        landmark = struct( ...
            'id', data{1}, ...
            'x' , data{2}, ...
            'y' , data{3});
        landmarks(i) = landmark;
        i = i+1;
    end

    % landmarks = landmarks(2:end);

    fclose(input);
end
