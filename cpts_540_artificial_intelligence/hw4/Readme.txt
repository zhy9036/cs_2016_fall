Wumpus Agent (12/01/2016)

Writen by Yang Zhang (11529139)

Global Assumputions:
1. World is 4 x 4 grid
2. Agent starts at (1, 1)
3. Wumpus can be anywhere other than (1, 1) or (4, 4)
4. There is between 1 to 3 pits. Pits can be anywhere other than (1, 1) 


The agent make a move based on the cost of all adjacent tiles and pick the
one with smallest cost to move on.

To calculate the cost:
	cost 1 per move or per turn
	if gold is not fetched
		move to vistied adjacent tile cost 5 more, this can make sure the agent doesn't dupulicate its path when
		finding the gold.
	if gold is fetched
		move to vistied adjacent tile cost 5 less, this can make sure the agent go back alone the safe path.
	if the tile's danger coefficient is 0.5, the agent is not sure if safe or not
		cost + 10
	if the tile's danger coefficient is 1.0, the agent is sure there is a pit or a live wumpus
		cost + 100
		
To track the safe places:
	when moving to any tile safty mark this tile's danger cofficient to be 0
	when the agent senses breeze or stench if the wumpus is still alive add 0.5 to
		every adjacent tile's danger coefficient.
		

Ending condition
if the agent at (1, 1) with gold
	then CLIMB out
if the agent at (1, 1) and no adjacent tile with less than 10 cost
	then CLIMB out, because the agent can not make safe move anymore. 