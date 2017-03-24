"""
YANG ZHAGN 1030416 zhy9036@uw.edu
CSE 417 HW4
"""


import time


def closestPair(input_file):
	f = open(input_file)
	points = []
	for line in f:
		raw_list = line.split()
		for i in range(0, len(raw_list)-1, 2):
			temp_pt = (float(raw_list[i]),float(raw_list[i+1])) 
			#if temp_pt in points:
				#return [temp_pt, temp_pt]
			points += [(float(raw_list[i]),float(raw_list[i+1]))]
	f.close()

	

	return closet_rec(points)

def closet_rec(points):

	# sort by x coordinate
	sortX = sorted(points, key = lambda tup: tup[0])

	# sort by y coordinate
	sortY = sorted(points, key = lambda tup: tup[1])
	length = len(sortX)
	if length <= 3:
		min_d = float('inf')
		min_pair = [sortX[0]]
		for p in sortX:
			for sub in sortX:
				if p != sub:
					cur_dis = _linear_dis(p, sub)
					min_d = cur_dis if cur_dis < min_d else min_d
					min_pair = [p,sub] if min_d == cur_dis else min_pair
		return min_pair

	# construct Qx Qy Rx Ry
	q_x = []
	r_x = []
	q_y = []
	r_y = []
	for index in range(0, length):
		if index < length/2:
			q_x.append(sortX[index])
		else:
			r_x.append(sortX[index])
	for point in sortY:
		if point in q_x:
			q_y.append(point)
		else:
			r_y.append(point)
	q_min = closet_rec(q_x)
	r_min = closet_rec(r_x)
	if len(q_min) == 2:
		q_min_dis = _linear_dis(q_min[0], q_min[1])
	else:
		q_min_dis = float('inf')
	if len(r_min) == 2:
		r_min_dis = _linear_dis(r_min[0], r_min[1])
	else:
		r_min_dis = float('inf')
	delta = q_min_dis if q_min_dis < r_min_dis else r_min_dis
	x_star = q_x[-1][0]

	# s sets contains points in sortX within distance delta of x_star
	s = []
	for pt in sortX:
		if abs(pt[0] - x_star) <= delta:
			s.append(pt)
	s_y = []
	for pot in sortY:
		if pot in s:
			s_y.append(pot)
	y_set_min_dis = float('inf')
	y_set_min_pair = []
	for yi in range(0, len(s_y)):
		if (len(s_y) - yi) >= 15:
			for yj in range(yi+1,yi+15):
				cur_dis = _linear_dis(s_y[yi],s_y[yj])
				if cur_dis < y_set_min_dis:
					y_set_min_dis = cur_dis
					y_set_min_pair = [s_y[yi],s_y[yj]]
		else:
			for yj in range(yi+1,len(s_y)):
				cur_dis = _linear_dis(s_y[yi],s_y[yj])
				if cur_dis < y_set_min_dis:
					y_set_min_dis = cur_dis
					y_set_min_pair = [s_y[yi],s_y[yj]]
	if y_set_min_dis < delta:
		return y_set_min_pair
	elif q_min_dis < r_min_dis:
		return q_min
	else:
		return r_min


def _linear_dis(p1, p2):
    temp = _sub(p1, p2)
    return (temp[0]**2 + temp[1]**2)**(0.5)

def _sub(a,b):
	return (a[0]-b[0],a[1]-b[1])

def main():

	t_start = time.time()

	hala = closestPair("t3.txt")

	total_time = round((time.time()-t_start)*1000*10000)/10000
	print '\n*** Run time: '+str(total_time)+' ms\n'

	print hala
	if len(hala) == 2:
		print _linear_dis(hala[0], hala[1])
	else:
		print 'Infinity'

main()