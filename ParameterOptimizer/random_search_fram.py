import random

def parameter_opt():
	pass

def sarsa(para_set):
	return 5

def random_search(para_set, pos, ran, learnAlg):
	
	step_size = 0.1
	g_r = float('-inf')
	g_p = 0
	for r in range(3):
		local_opt = False
		para_copy = para_set[:] 
		para_copy[pos] = random.randint(int(ran[0]*10), int(ran[1]*10))*1.0/10
		cur_reward = 0
		while not local_opt:
			para_left, para_right = None,None
			if para_copy[pos] > ran[0]:
				para_left = para_copy[pos] - step_size
			if para_copy[pos] < ran[1]:
				para_right = para_copy[pos] + step_size
			reward, r_left, r_right = learnAlg(para_copy), None, None
			if para_left:
	 			r_left = learnAlg(para_copy)
			if para_right:
				r_right = learnAlg(para_copy)
			p_list = [para_copy[pos], para_left, para_right]
			r_list = [reward, r_left, r_right]
			cur_reward = max(r_list)
			candidate = p_list[r_list.index(max(r_list))]
			if candidate == para_copy[pos]:
				local_opt = True
			else:
				para_copy[pos] = candidate
		if g_r < cur_reward:
			g_r = cur_reward
			g_p = para_copy[pos]
	
	return g_p, g_r

def test():
	print random_search([0.5,0.5,0.5,0.5], 0, (0.1, 0.9), sarsa)
		
