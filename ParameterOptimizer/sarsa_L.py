import gym
import time
import numpy as np
import sys
import random, copy
import Queue as Q
#sys.path.append("../")
# 0 - lambda
# 1 - epsilon
# 2 - gamma
# 3 - alpha
def sarsa_L(para_set, env_name, iteration, episode_limit, cutOff):
	e = para_set[1]
	#learning_rate = para_set[3]
	gamma = para_set[2]
	lamb = para_set[0]
	alpha = para_set[3]
	env = gym.make(env_name)
	env.reset()
	num_s = env.observation_space.n
	num_a = env.action_space.n
	def update_q_traces(q_values,traces, s, a):
		next_s, reward, done, info = env.step(a)
		if env_name == 'FrozenLake-v0':
			if not done:
				reward = -1
			if done and reward == 0:
				reward = -10
			if done and reward == 1:
				reward = 100	
		#env.render()
		#next_s = env.P[s][a][0][1]	
		#reward = env.P[s][a][0][2] 

		#terminal = env.P[s][a][0][3]
		prob = random.random()
		
		next_a = 0
		if prob > e:
			#greedy
			tmp = q_values[next_s]
			next_a = tmp.index(max(tmp))
		else:
			next_a = random.randint(0, num_a-1)
		delta = reward + gamma*q_values[next_s][next_a]-q_values[s][a]
		traces[s][a] += 1
		for i in range(num_s):
			for j in range(num_a):
				q_values[i][j] += delta*alpha*traces[i][j]
				traces[i][j] *= gamma*lamb	

		return reward, done, q_values, traces, next_s, next_a


	def sarsa_eligibility_trace(e_limit):
		q_values = [[0.0 for x in range(num_a)] for y in range(num_s)]
		eligibility_trace = [[0.0 for x in range(num_a)] for y in range(num_s)]
		state = env.s
		action = 0
		count = 0
		done = False
		reward = 0
		episode = 0
		total = 0
		while episode < e_limit:
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
					action = random.randint(0, num_a-1)
			
				r, done, q_values, eligibility_trace, state, action = update_q_traces(q_values, eligibility_trace, state, action)
				#print r
				#print done, state
			
				reward = reward + r
			#print reward
			#exit()
			env.reset()
			episode += 1
			ec = e_limit
			#sys.stdout.write("\repisode so far: %d %d" % (episode, reward))
			if episode > ec-cutOff:
				total += reward				
			if episode == ec:
				break
		return total*1.0/cutOff

	total_reward = 0
	r_list = []
	for i in range(iteration):
		total_reward += sarsa_eligibility_trace(episode_limit)
		r_list.append(total_reward * 1.0 / iteration)
	return np.mean(r_list)

def LearningCurve(para_set, env_name, iteration, episode_limit, cutOff, data_points_count):
	r_list = []
	ep_list = []
	reward = 0
	for e_limit in xrange(episode_limit/data_points_count, episode_limit, episode_limit/data_points_count):
		reward = sarsa_L(para_set, env_name, iteration, episode_limit, cutOff)
		r_list.append(reward)
		ep_list.append(e_limit)
	return r_list,ep_list








