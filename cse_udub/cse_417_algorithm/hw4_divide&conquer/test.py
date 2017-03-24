def test():
	ls = [(1,4),(2,3),(3,2),(4,1)]
	# sort by x coordinate
	sortX = sorted(ls, key = lambda tup: tup[0])
	# sort by y coordinate
	sortY = sorted(ls, key = lambda tup: tup[1])

	print sortX
	print sortY
test()
