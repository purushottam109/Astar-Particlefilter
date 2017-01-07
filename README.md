# Astar-Particlefilter

The Project includes the A* path planning with the Particle filter for tracking the robot for my CS685-Autonomous Robotics course. 

The motion planning problem:

Given a robot at an initial position, compute, how to gradually move it to a desired goal position over anefficient/shortest path while avoiding collision with obstacles. And track the robot with particle filter as it 
moves along the path.
The environment for the problem is 2D world, W = R2 and O ⊂ W is the obstacle region, which has apiecewise-linear (polygonal) boundary. The robot is a point that can move through the world, but mustavoid touching the obstacles.


Solution:
As a solution to the a modified version of A* algorithm is used to compute the path form the robot's position
to the goal, and the particle filter is used to track the robot's position in the environment and change the path 
if needed.

Result:
The A* approach was applied to the robot’s motion planning problem. The shortest path from the start to goalpositions was found. There is a tradeoff between the accuracy of the shortest path and speed of computing it. Itdepends on how fine the grid is. Smaller the cell, more precise is the path, more time consuming is the algorithmwhereas Larger the cell, less precise is the path and lesser time it takes to compute it.The computed path moves therobot towards the goal position in an efficient manner while avoiding collision with the obstacles.

Conclusions:
The A* approach works very well to find the shortest path and guide the robot to traverse an efficient path toreach from the start to the goal position. Besides A*, there are other algorithms that provide even better results incertain situations. The D* algorithm is like A* algorithm. D* works in the dynamic environment, where theobstacles and other information is not already known. Rapidly-Exploring Random Trees (RRT) is anothertechnique that addresses path finding problem by using a randomized approach that aims at quickly exploring alarge area of the search space with iterative refinement. Particle filters offer a simple and elegant solution the theproblem of robot localization. One of the great features of this algorithm is that it expends computational effort in away that is proportional to the importance of the particles.