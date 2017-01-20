// Agent.h

#ifndef AGENT_H
#define AGENT_H

#include "Action.h"
#include "Percept.h"
#include "WorldState.h"
#include "WumpusWorld.h"
#include "Location.h"
#include "Orientation.h"

class Agent
{
public:
	Agent ();
	~Agent ();
	void Initialize ();
	Action Process (Percept& percept);
	void GameOver (int score);
        int safeplaces [4][4]; 
        bool gold;
        bool arrow;
        Location curLoc;
        Location wumpLoc;
        Orientation curOri;
};

#endif // AGENT_H
