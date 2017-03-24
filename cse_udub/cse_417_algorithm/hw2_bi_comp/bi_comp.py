#CSE 417 
#YANG ZHANG 1030416
#HW 2 problem 4 bi_comp algorithm

import time

"""
 Main method
"""
def main():
	args = raw_input("\n\nEnter file name: ")
	t_start = time.time()
	f = open(args,"r")
	lines = iter(f)
	f.next() #skip the first line
	global edges
	global vertex
	global resultSet
	# list to store biconnected commponent
	resultSet = []
	# list to store edges
	edges = []
	# dict to store vertexes and their property
	vertex = {}
	for line in lines:
		edge = line.split()
		#dummy value for visit flag
		edge.append('NotVisted')
		if edge[0] not in vertex: # new key
			vertex[edge[0]] = [-1,-1,"root"]
		
		if edge[1] not in vertex:
			vertex[edge[1]] = [-1,-1,"root"]			
		edges.append(edge)	
	f.close()
	
	global stack
	stack = []
	global arti_point
	arti_point = []
	global dfs
	dfs = 0
	root = vertex.keys()[0]
	bi_comp(root, vertex[root])
	total_time = round((time.time()-t_start)*1000*10000)/10000
	printReuslt(total_time);

"""
 Method for printing result
"""
def printReuslt(total_time):
	print '\n*** Number of nodes: '+str(dfs)+'\n'
	print '*** Number of edges: '+str(len(edges))+'\n'
	print '*** Number of Biconnected Components: '+str(len(resultSet))+'\n'
	print '*** Number of Articulation Points: '+str(len(arti_point))+'\n'
	print '*** List of Articulation Points: '+str(arti_point)+'\n'
	print '*** List of Biconnected Components: '
	for x in range(0, len(resultSet)):
		print '    BC'+str(x+1)+': '+str(resultSet[x])
	print '\n*** Run time: '+str(total_time)+' ms\n'


"""
 Method for record bi_comp
"""
def recordBi_comp(edge):
	single = []
	while True:
		temp = stack.pop()
		single.append(temp)
		if temp == edge:
			resultSet.append(single)
			break

"""
 Actual method for DFS
"""
def bi_comp(v, v_info):
	global dfs
	dfs+=1
	# v_info[0] stores v.dfs, v_info[1] stores v.low, 
	# v_info[2] stores parent otherwise stores neighbors
	v_info[0] = dfs 
	v_info[1] = v_info[0]

	for edge in edges:
		if v in edge and len(edge) == 3:
			if edge[0] == v:
				x = edge[1]
			else:
				x = edge[0]
			if vertex[x][0] == -1: # new edge

				edge.pop()

				vertex[x][2] = v # record parent
				stack.append(edge)
				bi_comp(x, vertex[x])
				v_info[1] = min(v_info[1], vertex[x][1]) # min(v.low, x.low)

				# x.low >= v.dfs, a_point found, bi_comp found
				if vertex[x][1] >= v_info[0]:
					if vertex[v][2] != 'root' and v not in arti_point:
						arti_point.append(v)
					recordBi_comp(edge)
			elif v_info[2] != x: # x is not v's parent, back edge found

				edge.pop()
				stack.append(edge)
				v_info[1] = min(v_info[1], vertex[x][0]) # min(v.low, x.dfs)

#main function call
main()

