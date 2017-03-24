"""
YANG ZHAGN 1030416 zhy9036@uw.edu
CSE 417 HW4
"""


import time

def brute_force(input_file):
	f = open(input_file)
	#raw_list = f.readline().split()
	points = []
	min_dis = float('inf')
	# convert to points
	for line in f:
		raw_list = line.split()
		for i in range(0, len(raw_list)-1, 2):
			points += [(float(raw_list[i]),float(raw_list[i+1]))]
	#print points
	f.close()
	min_pair = []
	if len(points) == 1:
		return []
	for p in range(0, len(points)):
		for sub in range(p+1, len(points)):
			cur_dis = _linear_dis(points[p], points[sub])
			min_dis = cur_dis if cur_dis < min_dis else min_dis
			min_pair = [points[p], points[sub]] if cur_dis == min_dis else min_pair
	return min_pair

def _linear_dis(p1, p2):
    temp = _sub(p1, p2)
    return (temp[0]**2 + temp[1]**2)**(0.5)

def _sub(a,b):
	return (a[0]-b[0],a[1]-b[1])



t_start = time.time()
p = brute_force("t2.txt")

total_time = round((time.time()-t_start)*1000*10000)/10000
print '\n*** Run time: '+str(total_time)+' ms\n'

print p
if len(p) == 2:
	print _linear_dis(p[0], p[1])
else:
	print 'Infinity'