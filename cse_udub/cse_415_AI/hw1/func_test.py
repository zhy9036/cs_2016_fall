def MCR(hello):
	print 'hello one'

def MR(hello):
	print 'hello two'


def mainf():
	th = [MCR, MR]
	for x in range(0,2):
		th[x]('hh')
	th1 = ['a','b','c','d','e']
	th1.pop(2)
	print th1

mainf()
	