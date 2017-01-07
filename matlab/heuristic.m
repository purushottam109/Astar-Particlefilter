
function h=heuristic(X,goal)
h = sqrt(sum((X-goal).^2));% euclidean distance


% Manhattan distance
% dx = abs(X(1) - goal(1));
%     dy = abs(X(2) - goal(2));
%     h= (dx + dy) - min(dx, dy);


