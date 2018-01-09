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
state_num = 12
action_num = 4
e = 0.0
learning_rate = 0.01
Q_LEARNING_MODE = 0.01
SARSA_MODE      = 1     

def update_q(q_values, s, a, mode):
	next_s = env.P[s][a][0][1]
	reward = env.P[s][a][0][2]
	gamma = 0.9
	
	terminal = env.P[s][a][0][3]
	if mode == SARSA_MODE:
		prob = random.random()
		
		next_a = 0
		if prob > e:
			#greedy
			tmp = q_values[next_s]
			next_a = tmp.index(max(tmp))
		else:
			next_a = random.randint(0, 3)
			q_values[s][a] = q_values[s][a] + 1 * (reward + 
				gamma * q_values[next_s][next_a] - q_values[s][a])
			a = next_a

	elif mode == Q_LEARNING_MODE:
		q_max = max(q_values[next_s])
		q_values[s][a] += learning_rate * (reward + gamma*q_max -q_values[s][a])
	return q_values, next_s, a

def update_q_traces(q_values,traces, s, a):
	next_s = env.P[s][a][0][1]
	reward = env.P[s][a][0][2]

	terminal = env.P[s][a][0][3]
	prob = random.random()
	gamma = 0.9
	lamb = 0.4
	alpha = 0.01
	next_a = 0
	if prob > e:
		#greedy
		tmp = q_values[next_s]
		next_a = tmp.index(max(tmp))
	else:
		next_a = random.randint(0, 3)
	delta = reward + gamma*q_values[next_s][next_a]-q_values[s][a]
	traces[s][a] += 1
	for i in range(12):
		for j in range(4):
			q_values[i][j] += delta*alpha*traces[i][j]
			traces[i][j] *= gamma*lamb	

	return q_values, traces, next_s, next_a
	

def sarsa_eligibility_trace():
	q_values = [[0.0 for x in range(action_num)] for y in range(state_num)]
	eligibility_trace = [[0.0 for x in range(action_num)] for y in range(state_num)]
	state = 3
	action = 0
	count = 0
	flag = True
	while flag:
		
		if state in [3, 7]:
			state = 8
			prob = random.random()
			if prob > e:
				#greedy
				tmp = q_values[state]
				action = tmp.index(max(tmp))
			else:
				action = random.randint(0, 3)
		q_values, eligibility_trace, state, action = update_q_traces(q_values, eligibility_trace, state, action)
	
		policy = []
		opt = [3, 3, 3, 0, 0, 0, 0, 0, 0, 3, 0, 2]
		for i in range(12):
			l = q_values[i]
			policy.append(l.index(max(l)))
		#print policy
		count += 1
		if policy == opt:
			flag = False
	print count

		#print policy
	#print q_values	

	


def sersa():
	q_values = [[0.0 for x in range(action_num)] for y in range(state_num)]
	state = 3
	action = 0
	count = 0;
	flag = True
	while flag:
		count += 1
		if state in [3,7]:
			state = 8
			prob = random.random()
			if prob > e:
				#greedy
				tmp = q_values[state]
				action = tmp.index(max(tmp))
			else:
				action = random.randint(0, 3)

		q_values, state, action = update_q(q_values, state, action, SARSA_MODE)

		policy = []
		opt = [3, 3, 3, 0, 0, 0, 0, 0, 0, 3, 0, 2]
		for i in range(12):
			l = q_values[i]
			policy.append(l.index(max(l)))
		#print policy
		count += 1
		if policy == opt:
			flag = False
	print count

def q_learning():
	q_values = [[0.0 for x in range(action_num)] for y in range(state_num)]
	state = 8
	action = 0
	count = 0;
	flag = True
	while flag:
		count += 1
		if state in [3,7]:
			state = 8
		prob = random.random()
		if prob > e:
			#greedy
			tmp = q_values[state]
			action = tmp.index(max(tmp))
		else:
			action = random.randint(0, 3)

		q_values, state, action = update_q(q_values, state, action, Q_LEARNING_MODE)

		policy = []
		opt = [3, 3, 3, 0, 0, 0, 0, 0, 0, 3, 0, 2]
		for i in range(12):
			l = q_values[i]
			policy.append(l.index(max(l)))
		if policy == opt:
			flag = False
	#print policy
	#print q_values
	print e, count


#sersa()
#sarsa_eligibility_trace()

for i in range(9):
	e += 0.1
	learning_rate += 0.1
	q_learning()

#sersa();
#q_learning();