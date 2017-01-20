(X,Y) is agent's current Location
The agent will always do:
	if gold is not fetched yet
		1. Move rightward when safety and X<4
		2. Move upward when safety and X=4 and Y<4
		3. Grab gold when X=4 and Y=4
	if gold is fetched
		1. Move downward when safety and Y>1
		2. Move leftward when safety and Y=1 and X>1
		3. Climb when X=1 and Y=1
	if stench
		Shoot arrow towards moving direction.
		and mark safe places, the safe places stored in 'safeplaces' array. 
