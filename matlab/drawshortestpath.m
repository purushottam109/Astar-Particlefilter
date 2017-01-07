function drawshortestpath(landmarks,timestep,obstacles, path,g)



hold on;
grid on;
h = figure(2);

%rectangle('Position',[g(1) g(2) 0.2 0.2], 'FaceColor','k');




L = struct2cell(landmarks);
O = obstacles;

set(h, 'Visible', 'on');


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
line(path(:,1),path(:,2));
xlim([-1, 10]);
ylim([-1, 10]);

filename = sprintf('../plots/path.png', timestep);
print(filename, '-dpng');

end
