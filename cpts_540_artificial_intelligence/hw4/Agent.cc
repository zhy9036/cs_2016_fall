// Agent.cc

#include "Agent.h"

Agent::Agent ()
{
    
}

Agent::~Agent ()
{
    
}

void Agent::Initialize ()
{
    gold = 0;
    wumpusTest = false;
    wumpusDead = false;
    arrow = true;
    danger = false;
    curLoc = Location(1,1);
    curOri = RIGHT;
    for ( int i = 0; i < 5; i++ ){
        for ( int j = 0; j < 5; j++ ) {
            visited[i][j] = 0;
            dangers[i][j] = 0.0;
        }
    }
}

Action Agent::Process (Percept& percept)
{
    visited[curLoc.X][curLoc.Y] = 1;
    //dangers[curLoc.X][curLoc.Y] = 0;
    cout << "pos: " << curLoc.X << " " << curLoc.Y << endl;
    cout << curOri << endl;
    if(actionPool.size() > 0){
        Action a = actionPool.front();
        actionPool.pop();
        return a;
    }
    
    if(curLoc == Location(1,1) && gold)
        return CLIMB;
    
    if(percept.Glitter){
        gold = 1;
        return GRAB;
    }
    
    vector<Location> branches = getNeighbors();
    
    if(percept.Stench && !wumpusTest){
        if(arrow){
            arrow = false;
            //shoot the arrow
            /*
            if(curLoc.Y == 1 && curLoc.X < 4)
                shootActions(Location(curLoc.X+1, curLoc.Y));
            if(curLoc.X == 4 && curLoc.Y < 4)
                shootActions(Location(curLoc.X, curLoc.Y+1));
            if(curLoc.X > 1 && curLoc.Y == 4)
                shootActions(Location(curLoc.X-1, curLoc.Y));
            if(curLoc.X == 1 && curLoc.Y > 1)
                shootActions(Location(curLoc.X, curLoc.Y-1));
             */
            return SHOOT;
            
        }else{
            wumpusTest = true;
            if(percept.Scream) wumpusDead = true;
            /*
            if(!percept.Scream){
                if(curLoc.Y == 1 && curLoc.X < 4)
                    dangers[curLoc.X][curLoc.Y+1] = 1;
                if(curLoc.X == 4 && curLoc.Y < 4)
                    dangers[curLoc.X-1][curLoc.Y] = 1;
                if(curLoc.X > 1 && curLoc.Y == 4)
                    dangers[curLoc.X][curLoc.Y-1] = 1;
                if(curLoc.X == 1 && curLoc.Y > 1)
                    dangers[curLoc.X+1][curLoc.Y] = 1;
            }
             */
        }
    }
    
    if(percept.Breeze || (percept.Stench && !wumpusDead)){
        bool pitPosKnown = false;
        vector<Location>::iterator myIter;
        for(myIter = branches.begin(); myIter != branches.end(); myIter++) {
            if (dangers[myIter->X][myIter->Y] == 1) {
                pitPosKnown = true;
                break;
            }
        }
        // Estimate the pit location
        if (!pitPosKnown) {
            // Increase by 50% the probability of having some danger
            vector<Location>::iterator j;
            for(j = branches.begin(); j != branches.end(); j++) {
                if (!visited[j->X][j->Y]) {
                    if (dangers[j->X][j->Y] < 1) {
                        dangers[j->X][j->Y] += 0.5;
                    }
                    // Pit was found
                    if (dangers[j->X][j->Y] == 1) {
                        pitPosKnown = true;
                    }
                }
            }
            // If a pit was found clear the dangers from other tiles
            if (pitPosKnown) {
                for (j = branches.begin(); j != branches.end(); j++) {
                    if (dangers[j->X][j->Y]  < 1) {
                        dangers[j->X][j->Y] = 0.0;
                    }
                }
            }
        }
    } else {
        // From this tile nothing has sensed so set the neighbors to dangers
        vector<Location>::iterator i;
        for(i = branches.begin(); i != branches.end(); i++) {
            if (dangers[i->X][i->Y] < 1) {
                dangers[i->X][i->Y] = 0.0;
            }
        }
    }
    
    int currentCost = 999;
    Location next;
    vector<Location>::iterator i;
    for(i = branches.begin(); i != branches.end(); i++) {
        
        int cost = getCost(percept, Location(i->X, i->Y));
        cout << "Location: " << i->X << " : " << i->Y << endl;
        cout << "Cost: " << cost << endl;
        cout << "Danger: " << dangers[i->X][i->Y] << endl;
        if(cost < currentCost) {
            currentCost = cost;
            next.X = i->X;
            next.Y = i->Y;
        }
    }
    if(currentCost > 10){
        danger = true;
        return CLIMB;
    }
    moveActions(next);
    Action b = actionPool.front();
    actionPool.pop();
    return b;
}



int Agent:: getTurns(Location to){
    //cout << "in getTurns" << endl;
    Location from = Location(1,0);
    switch(curOri){
        case UP:
            from.X = 0;
            from.Y = 1;
            break;
        case DOWN:
            from.X = 0;
            from.Y = -1;
            break;
        case LEFT:
            from.X = -1;
            from.Y = 0;
            break;
    }
    Location dest = Location(to.X - curLoc.X, to.Y-curLoc.Y);
    double dotProduct = from.X * dest.X + from.Y * dest.Y;
    double lenProduct = hypot(from.X, from.Y) * hypot(dest.X, dest.Y);
    double theta = acos(dotProduct / lenProduct);
    if (curOri == UP && getDirection(dest) == RIGHT ||
        curOri == RIGHT && getDirection(dest) == DOWN ||
        curOri == DOWN && getDirection(dest) == LEFT ||
        curOri == LEFT && getDirection(dest) == UP) {
            theta *= -1;
    }
        // Count how many turns
    return (int)(theta / (3.1415926 / 2));
}
 Orientation Agent::getDirection(Location coords) {
    if (coords.X == +0 && coords.Y == +1) return UP;
    if (coords.X == +1 && coords.Y == +0) return RIGHT;
    if (coords.X == +0 && coords.Y == -1) return DOWN;
    if (coords.X == -1 && coords.Y == +0) return LEFT;
    return RIGHT;
}


 void Agent:: moveActions(Location to){
     int turns = getTurns(to);
     for(int i = 0; i < abs(turns); i++){
         if(turns < 0) actionPool.push(TURNRIGHT);
         if(turns > 0) actionPool.push(TURNLEFT);
     }
    if(to.X > curLoc.X)
        curOri = RIGHT;
    if(to.X < curLoc.X)
        curOri = LEFT;
    if(to.Y > curLoc.Y)
        curOri = UP;
    if(to.Y < curLoc.Y)
        curOri = DOWN;
    curLoc = to;
    actionPool.push(GOFORWARD);
 }
 
 void Agent::shootActions(Location to){
    int turns = getTurns(to);
    for(int i = 0; i < abs(turns); i++){
         if(turns < 0) actionPool.push(TURNRIGHT);
         if(turns > 0) actionPool.push(TURNLEFT);
         
         
    }
    if(to.X > curLoc.X)
        curOri = RIGHT;
    if(to.X < curLoc.X)
        curOri = LEFT;
    if(to.Y > curLoc.Y)
        curOri = UP;
    if(to.Y < curLoc.Y)
        curOri = DOWN;
    
    actionPool.push(SHOOT);
}
 
int Agent:: getCost(Percept& percept, Location to){
    //cout << "in getCost" << endl;
    int sum = 1;
    // If found gold choose the safest path otherwise costs more to return
    //cout << to.X << endl;
    if (visited[to.X][to.Y]) {
        
        if (gold) sum -= 5;
        else sum += 5;
    } else {
        // If senses a breeze avoid unvisited path
        if (percept.Breeze || (percept.Stench && !wumpusDead)) {
            
            if (dangers[to.X][to.Y] == 0.5 && (to.X != 4 && to.Y != 4)) {
                sum += 10;
            } else if (dangers[to.X][to.Y] == 1) {
                // Avoid tiles marked as 100% danger
                sum += 100;
            }
        }
    }

    // The amount of turns to take
    
    int turns = getTurns(to);
    //cout << "after" << endl;
    sum += abs(turns);

    return sum;


}
vector<Location> Agent:: getNeighbors(){
    vector<Location> tiles(5);
    vector<Orientation> nodesMap(5);
    
    // Calculate the next block
    int north = curLoc.Y - 1;
    int south = curLoc.Y + 1;
    int east = curLoc.X + 1;
    int west = curLoc.X - 1;
    //cout << west << endl;
    // Check if branch is into bounds
    int x = 0;
    //cout << "before" << endl;
    if (north > 0){
        
        nodesMap[x] = UP;
        
        x++;
    }
    if (south <= 4){  
        nodesMap[x] = DOWN;
        x++;
    }
    if (east <= 4){   
        nodesMap[x] = RIGHT;
        x++;
    }
    if (west > 0){  
        nodesMap[x] = LEFT;
        x++;
    }
    tiles.resize(x);
   
    for (int i = 0; i < x; i++) {
        //cout << i << endl;
        //nodesMap.at(i);
        //cout << "haha" << endl;
        switch (nodesMap[i]) {
            case UP: 
                tiles[i] = Location(curLoc.X, north);
                break;
            case DOWN: 
                tiles[i] = Location(curLoc.X, south);
                break;
            case RIGHT: 
                tiles[i] = Location(east, curLoc.Y);
                break;
            case LEFT: 
                tiles[i] = Location(west, curLoc.Y);
                break;
         
        }
          
    }
     
    
    return tiles;
}

void Agent::GameOver (int score)
{
    if(danger)
        cout <<"I have determined, I cannot safely snatch the gold!"<< endl;
}

