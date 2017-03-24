# This is a python program that allows an agent to compute
# the shortest path from an start point to a goal point
# that goes around rectangular obstacles. Each rectangular obstacle
# has four corners and the robot is only allowed to move from one corner
# to another. We call each corner a "State". A legal move is one from one
# corner to another without going through a rectangle obstacle.
# However, going along the outside is fine and common.

# This is a class for storing problem states.
# pos is the 2D coordinate position of the robot as a tuple
# g_val is the cost so far for A* search
# h_val is the heuristic function value for A* search
# f_val is the sum of g_val and h_val
# succ is the list of successors
# parent is the parent of the node

"""
***
*   YANG ZHANG 1030416
*   CSE 415 HW 2 A STAR
***

"""


from heap import *

class State(object):

    def __init__(self, pos = (0,0), g_val = 0, h_val = 0, f_val = 0, succ = [], parent = None):
        # WRITE SOME CODE HERE and delete the pass statement
        #pass
        self.pos = pos
        self.g_val = g_val
        self.h_val = h_val
        self.f_val = f_val
        self.succ = succ
        self.parent = parent





# 'astar' is a function that gives us the path and cost from start to goal state
# Input: Input file describing the problem instance.
# Output: Solution path and cost for that path.

# The code for parsing the input file to create different useful lists are already written here.
# See the course page for input file structure detail.
def astar(input_file):

    # Opening the input file
    f = open(input_file)

    # Retrieving start location from the first line of the file
    s = f.readline().split()[0:2]
    start = (int(s[0]),int(s[1]))

    # Retrieving goal location from the second line of the file
    s = f.readline().split()[0:2]
    goal = (int(s[0]),int(s[1]))

    # Retrieving number of obstacles.
    n_obstacles = f.readline()

    # Creating a list to store the obstacle corners.
    # They are stored in clockwise order as described in the course web-page
    obstacles = []
    for line in f:
        ln = line.split()

        # Each corner is a tuple of (x,y) location
        top_left = (int(ln[0]),int(ln[1]))
        top_right = (int(ln[2]),int(ln[3]))
        bottom_right = (int(ln[4]),int(ln[5]))
        bottom_left = (int(ln[6]),int(ln[7]))

        #'obstacles' is a list of tuples where each tuple contains four corner points
        obstacles += [(top_left,top_right,bottom_right,bottom_left)]

    # Closing the file. We don't need it anymore
    f.close()

    # Now we will create nodes and lines from all the obstacles.
    # remember the agent is only allowed to stay at one of these nodes
    # 'nodes' is a list of (x,y) tuples containing the x,y position of all nodes
    # 'lines' is a list of tuples where each tuple contains two nodes
    nodes = []; lines = []
    for obstacle in obstacles:
        nodes += [obstacle[0],obstacle[1],obstacle[2],obstacle[3]]
        lines += [(obstacle[0],obstacle[1])]
        lines += [(obstacle[1],obstacle[2])]
        lines += [(obstacle[2],obstacle[3])]
        lines += [(obstacle[3],obstacle[0])]


    # initial start state and goal state
    goal_point = State(goal,0,0,0, [], None)
    start_point = State(start, 0, 0, 0, [], None)
    start_point.h_val = _linear_dis_cost(start, goal)
    start_point.f_val = start_point.g_val + start_point.h_val 
    openlist = [start_point]
    closelist = []

    while openlist:
        heapify(openlist)
        # pop up the the state with smallest f_val currently
        current = heappop(openlist)
        
        # generate all valid sub_state of current state
        current.succ = find_valid_children(current, nodes, lines, obstacles, goal)

        for succ in current.succ:
            succ.g_val = current.g_val + _linear_dis_cost(current.pos, succ.pos)
            succ.h_val = _linear_dis_cost(succ.pos, goal)
            succ.f_val = succ.h_val + succ.g_val

            # found shortest path, return the result with final cost
            if succ.pos == goal:
                return _construct_path(start, succ, [succ.f_val])

            # check if openlist has same pos but worse f_val, 
            # if not skip this state
            if _checkIfHasBetter(succ, openlist):
                continue

            # check if closelist has same pos but worse f_val, 
            # if not skip this state
            if _checkIfHasBetter(succ, closelist):
                continue

            heappush(openlist,succ)
        closelist.append(current)
    # failure, path not found
    return []

"""
/**
* PRIVATE METHODS
*
**/
"""

# check if the current point has beffer f_val than before
def _checkIfHasBetter(state, s_list):
    for cur in s_list:
        if cur.pos == state.pos and cur.f_val<state.f_val:
            return True
    return False

# reconstruct path in ascending order 
def _construct_path(start, cur, result):
    result[0:0] = [cur] # slicing to front
    if cur.pos == start: 
        return result
    else:
        return _construct_path(start, cur.parent, result)

# calculate the linear distance between two points
def _linear_dis_cost(p1, goal):
    temp = sub(p1, goal)
    return (temp[0]**2 + temp[1]**2)**(0.5)

# print the reuslt path and h_val
def _printResult(r_list):
    print "%-16s %s"%("Point", "Cumulative Cost")
    for x in range(0, len(r_list)-1):
        print "%-16s %s\n"%(r_list[x].pos, r_list[x].g_val), 


# To implement A*, you might want to use a helper function which will
# find all the valid states you allowed to move to. Valid state means
# that the agent can move to that state without intersecting any rectangle.

# REMEMBER: You need to check whether a move intersects any rectangle.
# We have provided a function that does that checking for you.
# You need to call that function somewhere inside this function.
# Check def find_valid_move(p0,p1,lines,obstacles) to see the
# i/p and o/p of the function.
def find_valid_children(state,nodes,lines,obstacles,goal):

    # Empty list of children that needs to be returned by the function
    children = []
    start_pos = state.pos
    for node in nodes:
        if start_pos != node and find_valid_move(start_pos, node, lines, obstacles):
            children.append(State(node, 0, 0, 0, [], state))
    return children




# This function determines if the move from p0 to p1 is valid or not.

# Input: - 'p0' and 'p1' are two tuples containing starting and ending co-ordinate, respectively.
#        - 'lines' is a list of tuples where each tuple is two points. See the construction of 'lines'
#           in the astar function above.
#        - 'obstacles' is a list of tuples where each tuple contains four corner points. See the
#           construction of 'obstacles' in the astar function above.

# Output: - 'True' if the move is valid (does not intersect any obstacle)
#         - 'False' if the move is invalid (intersects a rectangle)

# Detail:  You are not required to understand the detail of this function to implement this assignment.
#          You can just call it directly whenever needed. But you can always dig deeper.
#          On a high level, this function tests if two lines intersect or not. One line
#          is the movement line and other is edge of all obstacles stored in the 'lines'
#          list. As each obstacle is made of four edges (lines), only checking the line
#          intersection is sufficient.

def find_valid_move(p0,p1,lines,obstacles):

    # Test if (p0,p1) is an edge of any obstacle,
    # which is already valid according to the problem definition.
    for obstacle in obstacles:
        if p0 in obstacle and p1 in obstacle:

            # Finding the indices
            i = obstacle.index(p0)
            j = obstacle.index(p1)

            # Make sure that i is the smaller index. This is very important as
            # the nodes are sorted in clockwise order
            if j < i:
                i,j = j,i

            # Indices are consecutive. So this is an edge
            if 1 == (j - i) or (0 == i and len(obstacle)-1 == j):
                return True
            else:
                return False

    # Now we have to find if the line (p0,p1) intersects any obstacle.
    # Obstacles are made of edges (lines). So just checking
    # if (p0,p1) intersects any line will be sufficient.

    for line in lines:
        # skip if p0 or p1 is an endpoint of this line
        if p0 in line or p1 in line:
            continue

        # We utilized vector math to figure out if any two lines intersects each other
        # The math details can be found here:
        # see http://www.cs.iastate.edu/~cs518/handouts/segment-intersect.ppt (Slide 4)
        r0 = sub(line[0],line[1])
        c0 = cross(sub(p0,line[1]),r0)
        c1 = cross(sub(p1,line[1]),r0)

        r1 = sub(p0,p1)
        c2 = cross(sub(line[0],p1),r1)
        c3 = cross(sub(line[1],p1),r1)

        # If the sign does not match, its an intersection
        if (c0 == 0 or c1 == 0 or sign(c0) != sign(c1)) and (c2 == 0 or c3 == 0 or sign(c2) != sign(c3)):
            return False

    return True


# The following three functions (sign, sub, and cross) are small helper functions used to
# implement find_valid_move function.

# returns the sign of a number as -1,0,1
def sign(x):
    if x == 0:
        return 0
    elif x < 0:
        return -1
    elif x >0:
        return 1
    else:
        return None

# Subtracting one point from another
def sub(a,b):
    return (a[0]-b[0],a[1]-b[1])

# return the vector cross product
# only need 2D case, so returns z component as scalar
# inputs are in form ((x0,y0),(x1,y1))
def cross(a,b):
    return a[0]*b[1]-a[1]*b[0]


# This is the main function. It calls the astar function and prints the result
# in appropriate format as described in the course web-page.
if __name__ == "__main__":

    # 'result' will store the output of the 'astar' function.
    # You need to print the result in appropriate format
    # as described in the course web-page
    result = astar('data1.txt')
    _printResult(result)

