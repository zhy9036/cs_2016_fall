import gym # Uncomment if using gym.make
import time
import sys
import random, copy
import Queue as Q

sys.path.append("../")
from envs.mdp_gridworld import MDPGridworldEnv

# Uncomment if you added MDPGridworld as a new gym environment
env = gym.make('MDPGridworld-v0')
# You have to import MDPGridworldEnv properly in order for environment to work
#env = MDPGridworldEnv()



def generate_episode(policy):
    episode=[]
    start_state = random.randrange(env.observation_space.n)
    start_action = random.randrange(4)
    done = False
    i = 0
    while not done and i < 100:
        i = i + 1
        reward = env.P[start_state][start_action][0][2]
        next_state = env.P[start_state][start_action][0][1]
        episode.append([(start_state, start_action), reward])
        start_state = next_state
        start_action = policy[start_state]
        done = True if start_state in [3, 7] else False
    return episode


def monte_carloES():
    q_values = {el:0 for el in [(x, y) for x in range(12) for y in range(4)]}
    policy = [0 for x in range(env.observation_space.n)]
    return_list = {el:(0, 0) for el in [(x, y) for x in range(12) for y in range(4)]}
    converge = False
    gamma = 0.9
    j = 0
    while j < 150:
        j = j + 1
        check_dict = {el:False for el in [(x, y) for x in range(12) for y in range(4)]} 
        episode = generate_episode(policy)
        for i in range(len(episode)):
            pair = episode[i][0]
            reward = episode[i][1]
            if not check_dict[pair]:
                check_dict[pair] = True
                for k in range(i+1, len(episode)):
                    reward = reward + episode[k][1] * pow(gamma, k)
                r = return_list[pair][0] + reward
                times = return_list[pair][1] + 1 
                return_list[pair] = (r, times)
                q_values[pair] = r / times

        for i in range(len(episode)):
            state = episode[i][0][0]
            best = 0;
            cur = q_values[(state, 0)]
            for k in range(1, 4):
                if q_values[(state, k)] > cur:
                    cur = q_values[(state, k)]
                    best = k

            policy[state] = best


        #converge = True if policy == pre_policy else False
 
    print policy

def pick_action(action_dict):
    action = random.choice([x for x in 
        action_dict for y in range(int(round(action_dict[x] * 100)))])
    return action


def generate_soft_episode(soft_policy):
    episode=[]
    start_state = 8
    start_action = pick_action(soft_policy[start_state])

    done = False
    i = 0
    while not done and i < 100:
        i = i + 1
        reward = env.P[start_state][start_action][0][2]
        next_state = env.P[start_state][start_action][0][1]
        episode.append([(start_state, start_action), reward])
        start_state = next_state
        start_action = pick_action(soft_policy[start_state])
        done = True if start_state in [3, 7] else False
    
    return episode

def monte_carloEsoft(e):
    q_values = {el:0 for el in [(x, y) for x in range(12) for y in range(4)]}
    soft_policy = [{x : 0.25 for x in range(4)} for y in range(12)]
    return_list = {el:(0, 0) for el in [(x, y) for x in range(12) for y in range(4)]}
    converge = False
    gamma = 0.9
    j = 0
    while j < 160:
        j = j + 1
        check_dict = {el:False for el in [(x, y) for x in range(12) for y in range(4)]} 
        episode = generate_soft_episode(soft_policy)
        for i in range(len(episode)):
            pair = episode[i][0]
            reward = episode[i][1]
            if not check_dict[pair]:
                check_dict[pair] = True
                for k in range(i+1, len(episode)):
                    reward = reward + episode[k][1] * pow(gamma, k)
                r = return_list[pair][0] + reward
                times = return_list[pair][1] + 1 
                return_list[pair] = (r, times)
                q_values[pair] = r / times

        for i in range(len(episode)):
            state = episode[i][0][0]
            best = 0;
            cur = q_values[(state, 0)]
            for k in range(1, 4):
                if q_values[(state, k)] > cur:
                    cur = q_values[(state, k)]
                    best = k

            for i2 in range(4):
                if i2 == best:
                    soft_policy[state][i2] = 1 - e + e/4
                else:
                    soft_policy[state][i2] = e/4
    p = []
    for i in range(12):
        p.append(pick_action(soft_policy[i]))
    #print p
    print soft_policy

monte_carloES()
#monte_carloEsoft(0.5)