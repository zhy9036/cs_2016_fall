# import gym # Uncomment if using gym.make
import time
import sys
import random
import Queue as Q

sys.path.append("../")
from envs.mdp_gridworld import MDPGridworldEnv

# Uncomment if you added MDPGridworld as a new gym environment
# env = gym.make('MDPGridworld-v0')
# You have to import MDPGridworldEnv properly in order for environment to work
env = MDPGridworldEnv()

# prints out that both states and actions are discrete and their valid values
# print env.observation_space
# print env.action_space

# to access the values
# print env.observation_space.n # env.nS
# print env.action_space.n # env.nA

# added delay here so you can view output above
# time.sleep(2)
'''
NORTH = 0
SOUTH = 1
WEST = 2
EAST = 3
'''
def Asynchronous_valueIteration():
    pq = Q.PriorityQueue()
    for x in range(env.observation_space.n):
        pq.put((0.0, x))
    values = [0 for x in range(env.observation_space.n)]
    gamma = 0.9
    theta = (1 - gamma) / gamma
    condition = True
    i = 0
    while not pq.empty():
        i = i + 1
        
        s = pq.get()
        state = s[1]
        if state not in [3, 7]:
            curE = [0 for x in range(4)]
            v = values[state]
            for a in range(4):
                probability = env.P[state][a][0][0]
                reward = env.P[state][a][0][2]
                next_state = env.P[state][a][0][1]
                curE[a] = probability * (reward + gamma * values[next_state])
            values[state] = max(curE)
            del curE[:]
            delta = abs(v - values[state])
            if (delta > theta): 
                pq.put((delta, state))

    print '\n\nvalueIteration, with gamma =',gamma
    print 'V*: ', values
    print 'Iterations: ', i



def valueIteration():
    values = [0 for x in range(env.observation_space.n)]
    gamma = 0.9
    theta = (1 - gamma) / gamma
    # print env.P[3][1]
    condition = True
    i = 0
    while condition:
        i = i + 1
        delta = 0
        for i in range(len(values)):
            if i not in [3, 7]:
                curE = [0 for x in range(4)]
                v = values[i]
                for a in range(4):
                    probability = env.P[i][a][0][0]
                    reward = env.P[i][a][0][2]
                    next_state = env.P[i][a][0][1]
                    curE[a] = probability * (reward + gamma * values[next_state])
                values[i] = max(curE)
                del curE[:]
                delta = max(delta, abs(v - values[i]))
        condition = False if (delta < theta) else True

    print '\n\nvalueIteration, with gamma =',gamma
    print 'V*: ', values
    print 'Iterations: ', i





def policyIteration(values, policy, gamma):
    gamma = gamma
    theta = (1 - gamma) / gamma
    policy_stable = False
    j = 0
    while not policy_stable:
        j = j + 1
        policy_stable = True

        ### policy evaluation

        condition = True

        while condition:
            i = 0
            delta = 0
            for i in range(len(values)):
                if i not in [3, 7]:
                    v = values[i]
                    a = policy[i]
                    probability = env.P[i][a][0][0]
                    reward = env.P[i][a][0][2]
                    next_state = env.P[i][a][0][1]
                    values[i] = probability * (reward + gamma * values[next_state])
                    delta = max(delta, abs(v - values[i]))

            condition = False if (delta < theta) else True

        ### policy improvement
        i = 0
        for i in range(len(values)):
            b = policy[i]
            randomList = []
            curE = [0 for x in range(4)]
            for a in range(4):
                probability = env.P[i][a][0][0]
                reward = env.P[i][a][0][2]
                next_state = env.P[i][a][0][1]
                val = probability * (reward + gamma * values[next_state])
                curE[a] = val
            for a in range(4):
                if curE[a] == max(curE):
                    randomList.append(a)
            policy[i] = curE.index(max(curE))#random.choice(randomList)

            del curE[:]
            policy_stable = False if (policy[i] != b) else policy_stable

    print '\n'
    print 'policyIteration, with gamma =',gamma
    print 'iteration:',j
    print 'PI*: ', policy
    print 'V*: ', values



valueIteration()
Asynchronous_valueIteration()
'''
for i in range(1,10):
    values = [0 for x in range(env.observation_space.n)]
    policy = [0 for x in range(env.observation_space.n)] 
    policyIteration(values, policy, i*1.0/10)
'''


'''
    state = 8
    action = 0 # North
    print env.P[state][action]
    # [(1.0, 4, -3, False)]
    # [(transition probability, next_state, reward, terminal)]
'''
