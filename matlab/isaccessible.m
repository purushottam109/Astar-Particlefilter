function value= isaccessible(goal, obstacles)

 
index=1;

while index<= size(obstacles,1)
    
    x=obstacles(index,2);
    y=obstacles(index,3);
    r=obstacles(index,4);
    
    obstacleCenter=[x,y];
    distance = sqrt(sum((goal-obstacleCenter).^2));
    if(distance>r)
        value=true;
        
    else
        value=false;
        break;
    end
    index=index+1;
end

end