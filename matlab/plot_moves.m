function plot_moves(current_node, landmarks, timestep, obstacles,filepaths,goal)


hold on;
grid on;

h = figure(1);
set(h, 'Visible', 'on');

L = struct2cell(landmarks);
O = obstacles;

rectangle('Position',[current_node(1) current_node(2) 0.08 0.08], 'FaceColor',[0 .5 0], 'LineWidth',.5)


for i=1: size(obstacles,1)
    
    x=obstacles(i,2);
    y=obstacles(i,3);
    r=obstacles(i,4);
    
    
    d = r*2;
    px = x-r;
    py = y-r;
    rectangle('Position',[px py d d],'Curvature',[1,1], 'FaceColor','c');
    
    
    i=i+1;
end
rectangle('Position',[goal(1) goal(2) 0.2 0.2], 'FaceColor','k');


plot(cell2mat(L(2,:)), cell2mat(L(3,:)), 'o');
xlim([-1, 10]);
ylim([-1, 10]);


filename = sprintf(filepaths, timestep);
print(filename, '-dpng');

end
