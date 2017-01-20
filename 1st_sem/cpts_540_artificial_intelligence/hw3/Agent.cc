// Agent.cc

#include <iostream>
#include "Agent.h"

using namespace std;

Agent::Agent ()
{
    
}

Agent::~Agent ()
{
    
}

void Agent::Initialize ()
{
    gold = 0;
    curLoc = Location(1,1);
    curOri = RIGHT;
    for ( int i = 0; i < 4; i++ ){
        for ( int j = 0; j < 4; j++ ) {
            if(i==0&&j==0 ||i==3&&j==3)
                safeplaces[i][j] = 1;
            else
                safeplaces[i][j] = 0;
        }
    }
}

Action Agent::Process (Percept& percept)
{
        
    if(!gold){
        if (curLoc == Location(4,4)){
            gold = 1;
            return GRAB;
        }else{

            if(percept.Stench){
                if(arrow){
                    if(curLoc.Y == 1){
                        if(curOri == RIGHT){
                            if(curLoc.X != 4){
                                arrow = false;
                                return SHOOT;
                            }else{
                                curOri = UP;
                                return TURNLEFT;
                            }
                        }else{
                            if(curOri == UP && curLoc.X==4){
                                arrow = false;
                                return SHOOT;
                            }else if(curOri == DOWN){
                                curOri = RIGHT;
                                return TURNLEFT;
                            }else{
                                curOri = UP;
                                return TURNRIGHT;
                            }

                        }
                    }else if(curLoc.Y == 4){ // don't care case 
                        if(curOri == LEFT){
                            arrow = false;
                            return SHOOT;
                        }else{
                            if(curOri == UP){
                                curOri = LEFT;
                                return TURNLEFT;
                            }else if(curOri == DOWN){
                                curOri = LEFT;
                                return TURNRIGHT;
                            }else{
                                curOri = UP;
                                return TURNLEFT;
                            }

                        }
                    }else if(curLoc.X == 4){ 
                        if(curOri == UP){
                            arrow = false;
                            return SHOOT;
                        }else{
                            if(curOri == RIGHT){
                                curOri = UP;
                                return TURNLEFT;
                            }else if(curOri == LEFT){
                                curOri = UP;
                                return TURNRIGHT;
                            }else{
                                curOri = RIGHT;
                                return TURNLEFT;
                            }

                        }
                    }else{ // don't care case curLoc.X == 1
                        if(curOri == DOWN){
                            arrow = false;
                            return SHOOT;
                        }else{
                            if(curOri == RIGHT){
                                curOri = DOWN;
                                return TURNRIGHT;
                            }else if(curOri == LEFT){
                                curOri = DOWN;
                                return TURNLEFT;
                            }else{ // curOri == UP
                                curOri = LEFT;
                                return TURNLEFT;
                            }

                        }
                    }

                }
            }

             if(curLoc.X != 4){
                if(curOri == RIGHT){
                    safeplaces[curLoc.X-1][curLoc.Y-1] = 1;
                    curLoc.X++;

                    return GOFORWARD;
                }else
                    return GOFORWARD;
            }else if(curLoc.Y != 4){
                if(curOri == RIGHT){
                    curOri = UP;
                    return TURNLEFT;
                }else{
                    safeplaces[curLoc.X-1][curLoc.Y-1] = 1;
                    curLoc.Y++;
                    return GOFORWARD;
                }
            }
        }
    }else{
        if(curLoc == Location(1,1)){
            return CLIMB;
        }else{
            if(curLoc.Y != 1){
                if(curOri == DOWN){
                    curLoc.Y--;
                    return GOFORWARD;
                }else{
                    if(curOri == UP){
                        curOri = RIGHT;

                    }else{
                        curOri = DOWN;
                    }
                    return TURNRIGHT;
                }
            }else if(curLoc.X != 1){
                if(curOri == LEFT){
                    curLoc.X--;
                    return GOFORWARD;
                }else{
                    curOri = LEFT;
                    return TURNRIGHT;
                }
            }
        }
    }
}

void Agent::GameOver (int score)
{
    cout <<"Final Score: "<< score << endl;
}

