outputVideo = VideoWriter(fullfile('../plots/A*moves','Astar.mp4'));

open(outputVideo)

for ii = 0:50
    filename = [sprintf('../plots/A*moves/plot_%03d',ii) '.png'];
   img = imread(filename);
   writeVideo(outputVideo,img)
end 