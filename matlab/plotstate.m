function plotstate(particles, weights, landmarks, timestep, path, obstacles,filepaths,g)
 
clf
h = figure(3);
title('Localization of the robot by the particle filter');
set(h, 'Visible', 'on');
hold on;
grid on;
line(path(:,1),path(:,2));
drawrobot(mean_position(particles, weights), 'r', 3, 0.3, 0.3);
index=1;
while index<= size(obstacles,1)
    
    x=obstacles(index,2);
    y=obstacles(index,3);
    r=obstacles(index,4);
    
    
    d = r*2;
    px = x-r;
    py = y-r;
    rectangle('Position',[px py d d],'Curvature',[1,1], 'FaceColor','c');
    
    index=index+1;
end
rectangle('Position',[g(1) g(2) 0.2 0.2], 'FaceColor','k');


L = struct2cell(landmarks);
h = figure(3);
set(h, 'Visible', 'on');
plot(particles(:, 1), particles(:, 2), '.','color','b');
plot(cell2mat(L(2,:)), cell2mat(L(3,:)), 'o');
drawrobot(mean_position(particles, weights), 'r', 3, 0.3, 0.3);

line(path(:,1),path(:,2));
%      xlim([-1, 10]);
%      ylim([-1, 10]);

filename = sprintf(filepaths, timestep);
print(filename, '-dpng');

end
