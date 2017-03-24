import time
import random
import copy

import io

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
    time_limit=5

    def move(self, a, b, a_fin, b_fin, t):
        #For test only: return a random move
        #r = []
        #for i in range(6):
        #    if a[i] != 0:
        #       r.append(i)
        # To test the execution time, use time and file modules
        # In your experiments, you can try different depth, for example:
        #f = open('time.txt', 'a') #append to time.txt so that you can see running time for all moves.
        # Make sure to clean the file before each of your experiment
        #for d in [3, 5, 7]: #You should try more
        #    f.write('depth = '+str(d)+'\n')
        #    t_start = time.time()
        #    self.minimax(depth = d)
        #    f.write(str(time.time()-t_start)+'\n')
        #f.close()
        #return r[random.randint(0, len(r)-1)]
        #But remember in your final version you should choose only one depth according to your CPU speed (TA's is 3.4GHz)
        #and remove timing code. 
        move=self.minimax(a,b,a_fin,b_fin,5)
        return move
        #Comment all the code above and start your code here

    # calling function
    def minimax(self, a,b,a_fin,b_fin,depth):
        #example: doing nothing but wait 0.1*depth sec
        #time.sleep(0.1*depth)
        global start
        start=time.time()
        st = self.state(a, b, a_fin, b_fin)
        v=self.get_max(st,float("-inf"),float("inf"),depth)
        end=time.time()
        elapsed_time=end-start
        print v[0]
        return v[1]

    def get_max(self,state,alpha,beta,depth):
        value = float("-inf")
        end = time.time()
        elapsed_time = end-start
        index=0
        children = self.get_children(state)
        if self.terminal_test(state, depth, elapsed_time):
            for child in children:
                cvalue = self.h(state)
                index=child[1]
                if cvalue >= value:
                    value=cvalue
                    index=child[1]
            print '******************',[value, index]
            return [value, index]
        else:
            depth = depth-1
            for child in children:
                value = max(value,self.get_min(child[0], alpha, beta, depth)[0])
                index=child[1]
                if value >= beta:
                    return [value, index]
                alpha = max(alpha,value)
            return [value, index]


    def get_min(self,state,alpha,beta,depth):
        value = float("inf")
        end = time.time()
        elapsed_time = end-start
        index=0
        children = self.get_children(state)
        if self.terminal_test(state, depth, elapsed_time):
            for child in children:
                cvalue = self.h(state)
                index=child[1]
                if cvalue < value:
                    value=cvalue
                    index=child[1]
            print '******************',[value, index]
            return [value, index]
        else:
            depth = depth-1
            for child in children:
                value = min(value,self.get_max(child[0], alpha, beta, depth)[0])
                index=child[1]
                if value <=alpha:
                    return [value, index]
                beta = min(beta,value)
            return [value, index]


    #heyristic function, simply calculate the difference of a_fin and b_fin
    def h(self,state):
        return state.a_fin-state.b_fin

    def get_children(self,state):
        children=[]
        for i in range(6):
            s = copy.deepcopy(state)
            if s.a[i] != 0:
                num = s.a[i]
                s.a[i] = 0
                if i + num < 6:
                    for j in range(i+1,i+num+1):
                        s.a[j] += 1
                   #special case: If your last stone lands in your own empty hole,
                   #you take all the stones in the opponent's opposite hole and put them in your Kalah.
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
                    remain = surplus % 14
                    rounds = surplus / 14
                    if rounds > 0:
                        for i in range(6):
                            s.a[i] = s.a[i] + rounds
                            s.b[i] = s.b[i] + rounds
                        s.a_fin = s.a_fin + rounds
                        s.b_fin = s.b_fin + rounds
                    s.b_fin = (s.b_fin + 1) if remain > 7 else s.b_fin
                    for j in range(1, remain+1):
                        if j < 7:
                            s.b[j-1] += 1
                        elif j == 7:
                            s.b_fin += 1
                        else:
                            s.a[j-8] += 1

                    if remain > 7 and rounds == 0:
                        offset = remain - 8

                        if s.a[offset] == 1:
                            s.a_fin += s.b[5-offset]
                            s.b[5-offset] = 0

                #swap a b holes
                temp = s.a
                s.a = s.b
                s.b = temp
                fin = s.a_fin
                s.a_fin = s.b_fin
                s.b_fin = fin
                children.append([s,i])
        #print children
        return children

    def terminal_test(self, state, depth, t):
        if state.a_fin >= 36 or state.b_fin >= 36 or t >= time_limit or depth <= 0:
            return True
        else:
            return False







