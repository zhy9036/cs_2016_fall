// Agent.h

#ifndef AGENT_H
#define AGENT_H

#include "Action.h"
#include "Percept.h"
#include "WorldState.h"
#include "WumpusWorld.h"
#include "Location.h"
#include "Orientation.h"
#include <queue>
#include <iostream>
#include <cmath>
#include <map>
#include <vector>



using namespace std;

class Agent
{
public:
	Agent ();
	~Agent ();
	void Initialize ();
	Action Process (Percept& percept);
	void GameOver (int score);
        void shootActions(Location);
        void moveActions(Location);
        int getCost(Percept&, Location);
        vector<Location> getNeighbors();
    
        Orientation getDirection(Location);
        int getTurns(Location);
        double dangers[5][5]; 
        int visited[5][5];
        bool gold;
        bool arrow;
        bool wumpusDead;
        bool wumpusTest;
        bool danger;
        Location curLoc;
        Location wumpLoc;
        Orientation curOri;
        queue<Action> actionPool;
};

#endif // AGENT_H
