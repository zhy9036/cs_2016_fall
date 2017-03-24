def closest_pair(input_file):
	f = open(input_file)
	points = []
	for line in f:
		raw_list = line.split()
		for i in range(0, len(raw_list)-1, 2):
			temp_pt = (float(raw_list[i]),float(raw_list[i+1])) 
			if temp_pt in points:
				return [temp_pt, temp_pt]
			points += [(float(raw_list[i]),float(raw_list[i+1]))]
	f.close()
	return _closest_pair(points)



def _closest_pair(points):
	length = len(points)

	#print "length = "+str(length)

	if length <= 3:
		min_d = float('inf')
		min_pair = []
		for p in points:
			for sub in points:
				if p != sub:
					cur_dis = _linear_dis(p, sub)
					min_d = cur_dis if cur_dis < min_d else min_d
					min_pair = [p,sub] if min_d == cur_dis else min_pair
					print 'min pair = '+str(min_pair)
		return min_pair 
	"""
	if length == 0:
		return float('inf')
	if length == 1:
		return float('inf')
	if length == 2:
		return _linear_dis(points[0], points[1])
	"""

	# sort by x coordinate
	sortX = sorted(points, key = lambda tup: tup[0])
	#print len(sortX)
	x_half = sortX[(length-1)/2][0]

	#print "x_half = "+str(x_half)
	right_half = []
	left_half = []
	for x in range(0, length):
		if x < length/2:
			left_half.append(points[x])
		else:
			right_half.append(points[x])
	left_pair = _closest_pair(left_half)
	right_pair = _closest_pair(right_half)
	
	print left_half
	print right_half

	#left_delta = _closest_pair(left_half)
	#right_delta = _closest_pair(right_half)



	left_delta = _linear_dis(left_pair[0], left_pair[1])
	right_delta = _linear_dis(right_pair[0], right_pair[1])
	delta = min(left_delta, right_delta)
	minPair = left_pair if delta == left_delta else right_pair
	remins = []
	for p in points:
		if abs(p[0]-x_half) <= delta:
			remins.append(p)
	# sort by y coordinate
	remins.sort(key = lambda tup: tup[1]) 
	"""
	for i in range(0, len(remins)):
		k = 0
		while i+k < len(remins)-1 and remins[i+k][1]< (remins[i][1]+delta):
			if i+k != k:
				minPair = [remins[i], remins[i+k]]
				delta = min(delta, _linear_dis(remins[i], remins[i+k]))
			k = k + 1
	return minPair
	"""
	for yi in range(0, len(remins)):
		if (len(remins) - yi) >= 15:
			for yj in range(yi+1,yi+16):
				cur_dis = _linear_dis(remins[yi],remins[yj])
				if cur_dis < y_set_min_dis:
					y_set_min_dis = cur_dis
					y_set_min_pair = [remins[yi],remins[yj]]
		else:
			for yj in range(yi+1,len(remins)):
				cur_dis = _linear_dis(remins[yi],remins[yj])
				if cur_dis < y_set_min_dis:
					y_set_min_dis = cur_dis
					y_set_min_pair = [remins[yi],remins[yj]]
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

print closest_pair('t3.txt')