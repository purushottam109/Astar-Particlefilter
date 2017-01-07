function [path] = Astar(start , goal,landmarks , obstacles)

ClosedSet=[];
OpenSet=[start(1), start(2), 0 , 0 ,0, 0];
VisitedSet=[];
ID =0;
parentID=0;
step=0.1;
current_node = [start(1),start(2)];
Moves_possible =[[-step,step]; [0,step]; [step,step]; [-step,0]; [step,0]; [-step,-step]; [0,-step]; [step,-step]];


timesteps=1;

while (abs(current_node(1)-goal(1))>0.05 || abs((current_node(2)-goal(2)))>0.05)
    
    if(size(OpenSet,1)==0)
        display('No path from start to goal');
        break;
    end
    
    [minval, I]=min(OpenSet,[],1);
    
    current_node = OpenSet(I(3),:);
    
    ClosedSet=[ClosedSet; current_node];
    
    OpenSet(I(3),:)=[];
    
    distance= current_node(6)+ step ;
    
    
    parentID=current_node(5);
    
    for possiblemoves=1:8
        new_node= [(current_node(1)+Moves_possible(possiblemoves,1)),(current_node(2)+Moves_possible(possiblemoves,2))];
        
        if ( ~inVisitedSet(new_node,VisitedSet, OpenSet) && isValid(new_node,obstacles))
            
            cost =  distance + heuristic(new_node,goal);
            ID=ID+1;
            OpenSet = [OpenSet; new_node(1),new_node(2), cost , parentID, ID, distance ];
        end
        
    end
    
    VisitedSet =[VisitedSet; current_node(1:2)];
    
    timesteps=timesteps+1;
    
    plot_moves(current_node, landmarks, timesteps, obstacles,'../plots/A*moves/plot_%03d.png',goal);
    
end


path=[current_node(1:2)];
last_parentID=current_node(4);

while (last_parentID>0)
    ID = find( ClosedSet( :, 5 ) == last_parentID );
    
    path=[[ClosedSet(ID,1),ClosedSet(ID,2)];path];
    
    last_parentID=ClosedSet(ID,4);
    
end


end

function val= isValid(new_node, obstacles)


i=1;

for i = 1:size(obstacles,1)
    
    x=obstacles(i,2);
    y=obstacles(i,3);
    r=obstacles(i,4);
    
    centre=[x,y];
    d = sqrt(sum((new_node-centre).^2));
    if(d>r)
        val=true;
    else
        val=false;
        break;
    end
    i=i+1;
end
end


function val = inVisitedSet(new_node, VisitedSet, OpenSet)

val=false;

for i=1:size(VisitedSet,1)
    if(new_node(1)==VisitedSet(i,1)&&new_node(2)==VisitedSet(i,2)   )
        
        val=true;
        return;
        
    end
end

for i=1:size(OpenSet,1)
    if(new_node(1)==OpenSet(i,1)&&new_node(2)==OpenSet(i,2)   )
        
        val=true;
        return;
        
    end
end

end


