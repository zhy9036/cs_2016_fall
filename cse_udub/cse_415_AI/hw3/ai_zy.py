#CSE415
#Yang Zhang & Hongyao Zhang

import time
import random 
import io
import copy

class key:
    def key(self):
        return "10jifn2eonvgp1o2ornfdlf-1230"

class ai:
    def __init__(self):
        pass

    class state:
        def __init__(self, a, b, a_fin, b_fin):
            self.a = a
            self.b = b
            self.a_fin = a_fin
            self.b_fin = b_fin

    # Kalah:
    #         b[5]  b[4]  b[3]  b[2]  b[1]  b[0]
    # b_fin                                         a_fin
    #         a[0]  a[1]  a[2]  a[3]  a[4]  a[5]
    # Main function call:
    # Input:
    # a: a[5] array storing the stones in your holes
    # b: b[5] array storing the stones in opponent's holes
    # a_fin: Your scoring hole (Kalah)
    # b_fin: Opponent's scoring hole (Kalah)
    # t: search time limit (ms)
    # a always moves first
    #
    # Return:
    # You should return a value 0-5 number indicating your move, with search time limitation given as parameter
    # If you are eligible for a second move, just neglect. The framework will call this function again
    # You need to design your heuristics.
    # You must use minimax search with alpha-beta pruning as the basic algorithm
    # use timer to limit search, for example:
    # start = time.time()
    # end = time.time()
    # elapsed_time = end - start
    # if elapsed_time * 1000 >= t:
    #    return result immediately 
    global time_limit 
    time_limit = 1

    def move(self, a, b, a_fin, b_fin, t):
        '''r = []
        for i in range(6):
            if a[i] != 0:
                r.append(i)
        # To test the execution time, use time and file modules
        # In your experiments, you can try different depth, for example:
        f = open('time.txt', 'a') #append to time.txt so that you can see running time for all moves.
        # Make sure to clean the file before each of your experiment
        f.close()
    
        for d in [3, 5, 7]: #You should try more
            f.write('depth = '+str(d)+'\n')
            t_start = time.time()
            self.minimax(depth = d)
            f.write(str(time.time()-t_start)+'\n')
        f.close()
        return r[random.randint(0, len(r)-1)]
        #But remember in your final version you should choose only one depth according to your CPU speed (TA's is 3.4GHz)
        #and remove timing code. 

        '''

        decision = self.minimax(a,b,a_fin,b_fin,5)
        print '\n\ndecision = ',decision
        return decision

    # calling function
    '''
    The main algorithm wrapper function returns the final choice
    '''
    def minimax(self, a,b,a_fin,b_fin,depth):
        global start 
        start = time.time()
        
        decision = self._get_max(-float('inf'), float('inf'), self.state(a, b, a_fin, b_fin),depth)
        end = time.time()
        elapsed_time = end - start
        print '\n(value, index) --> ',decision
        print 'time spent: ',elapsed_time
        
        return decision[1]



    '''
    Method for choose value at min level, 
    returns the worest move of the opponent
    '''
    
    def _get_min(self, alpha, beta, state, depth):

        min_value = float('inf')
        action_index = 0;

        #set up time out
        end = time.time()
        elapsed_time = end - start

        children = self._get_successors(state)

        bound = len(children)

        if bound == 0:
            min_value = -float('inf')

        if depth > 0 and elapsed_time < time_limit:
            for index in range(0,bound):
                min_value = min(min_value, self._get_max(alpha, beta, children[index][0], depth-1)[0]) 
                action_index = children[index][1]
                if min_value <= alpha:
                    return [min_value, action_index] 
                beta = min(beta, min_value)
            return [min_value, action_index]
        else:
            for index in range(0,bound):
                cur_value = self._heristic(children[index][0]) 
                cur_index = children[index][1]
                if cur_value < min_value: 
                    min_value = cur_value
                    action_index = cur_index
            return [min_value, action_index]


    '''
    Method for choose value at max level, 
    returns the best move of the play itself
    '''   
    def _get_max(self, alpha, beta, state, depth):

        max_value = -float('inf')
        action_index = 0;
        children = self._get_successors(state)

        bound = len(children)
        #set up time out
        end = time.time()
        elapsed_time = end - start

        if bound == 0:
            max_value = float('inf')

        if depth > 0 and elapsed_time < time_limit:
            for index in range(0,bound):
                max_value = max(max_value, self._get_min(alpha, beta, children[index][0], depth-1)[0]) 
                action_index = children[index][1]
                if max_value >= beta: 
                    return [max_value, action_index]
                alpha = max(alpha, max_value)
            return [max_value, action_index]

        else:
            for index in range(0,bound):
                cur_value = self._heristic(children[index][0]) 
                cur_index = children[index][1]

                if cur_value > max_value: 
                    max_value = cur_value
                    action_index = cur_index
            return [max_value, action_index]



    '''
    Method for generating all possible move
    according to current state
    '''
    def _get_successors(self,cur_state):
        moves = []

        for i in range(0,6):
            s = copy.deepcopy(cur_state)
            if s.a[i] != 0:
                num = s.a[i]
                s.a[i] = 0

                if i + num < 6:
                        
                    for j in range(i+1,i+num+1):
                            s.a[j] += 1

                    '''
                    special case: If your last stone lands in your own empty hole,
                    you take all the stones in the opponent's opposite hole and put
                    them in your Kalah.
                    '''
                    final = num+i
                    if s.a[final] == 1:
                            s.a_fin += s.b[5-final]
                            s.b[5-final] = 0
                        
                elif i + num == 6:
                    for j in range(i+1,6):
                               
                        s.a[j] += 1
                    s.a_fin += 1
                else:
                    for j in range(i+1,6):
                        s.a[j] += 1
                    s.a_fin += 1

                    surplus = (num - (6-i))
                    
                    remainer = surplus % 14
                    rounds = surplus / 14
                             
                    if rounds > 0:
                        for i in range(6):
                            s.a[i] = s.a[i] + rounds 
                            s.b[i] = s.b[i] + rounds
                        s.a_fin = s.a_fin + rounds 
                        s.b_fin = s.b_fin + rounds
                    
                    s.b_fin = (s.b_fin + 1) if remainer > 7 else s.b_fin
                            
                    for j in range(1, remainer+1):

                        if j < 7:
                            s.b[j-1] += 1
                        elif j == 7:
                            s.b_fin += 1
                        else:
                            s.a[j-8] += 1
                    
                    if remainer > 7 and rounds == 0:
                        offset = remainer - 8

                        if s.a[offset] == 1:
                            s.a_fin += s.b[5-offset]
                            s.b[5-offset] = 0
                '''
                swap holes
                '''
                temp = s.a
                s.a = s.b
                s.b = temp
                fin = s.a_fin
                s.a_fin = s.b_fin
                s.b_fin = fin
                moves.append([s,i])


        return moves


    '''
    Method for evaluate the passed in state
    '''
    def _heristic(self,state):
        pcg = 2
        b_total = 0
        a_total = 0
        fin = (state.a_fin - state.b_fin)*pcg
        for i in range(6):
            a_total += state.a[i]
            b_total += state.b[i]
        return fin






