import gym
import time
import sys
import random, copy
import Queue as Q
#sys.path.append("../")
# 0 - south
# 1 - north 
# 2 - east
# 3 - west
# 4 - pickUp
# 5 - dropOff
e = 0.1
learning_rate = 0.01
env = gym.make('Taxi-v2')
env.reset()


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
		next_a = random.randint(0, 5)
	delta = reward + gamma*q_values[next_s][next_a]-q_values[s][a]
	traces[s][a] += 1
	for i in range(500):
		for j in range(6):
			q_values[i][j] += delta*alpha*traces[i][j]
			traces[i][j] *= gamma*lamb	

	return reward, terminal, q_values, traces, next_s, next_a


def sarsa_eligibility_trace():
	q_values = [[0.0 for x in range(6)] for y in range(500)]
	eligibility_trace = [[0.0 for x in range(6)] for y in range(500)]
	state = env.s
	action = 0
	count = 0
	done = False
	reward = 0
	episode = 0
	while True:
		reward = 0
		done = False
		state = env.s
		while not done:
			prob = random.random()
			if prob > e:
				#greedy
				tmp = q_values[state]
				action = tmp.index(max(tmp))
			else:
				action = random.randint(0, 5)
			#env.step(action)
			#env.render()
			r, done, q_values, eligibility_trace, state, action = update_q_traces(q_values, eligibility_trace, state, action)
			reward = reward + r
		print reward
		exit()
		env.reset()
		episode += 1
		sys.stdout.write("\repisode so far: %d %d" % (episode, reward))
		if episode == 500:
			exit()
		
	

sarsa_eligibility_trace()
