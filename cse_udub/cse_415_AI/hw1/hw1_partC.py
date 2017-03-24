'''
Yang Zhang
CSE 415 HW1
part A, B and C
'''


#
# This is a Python program to find all solutions to the Missionary-Cannibal
# Problem using a blind depth-first search with a stack keeping track of
# the path from the root to the current state.
#
import copy
class State:
   "Missionary-Cannibal-Boat State"
#
# Finish state definition here.
#
   def __init__(self, nmiss=0, ncann=0, bside=' '):
		#WRITE SOME CODE HERE
		self.nmiss = nmiss
		self.ncann = ncann
		self.bside = bside

#
# The describe method returns a string form of a State: e.g. (0, 0, L) or (3, 1, R)
#
   def describe(self):
		#WRITE SOME CODE HERE
		return '('+str(self.nmiss)+', '+str(self.ncann)+', '+str(self.bside)+')'

#
# The goal method returns True if the state is the goal state (0, 0, 'R')
#
   def goal(self):
		#WRITE SOME CODE HERE
		if self.describe() == '(0, 0, R)':
			return True
		else:
			return False

#
# The illegal method returns True if a state is illegal, meaning there are
# more cannibals than missionairies on either side of the rivers.
#
   def illegal(self):
		#check if the count is within the range
		if self.nmiss<0 or self.nmiss>3 or self.ncann<0 or self.ncann>3:
			return True
		#check if cann is more that miss when miss spread on both side
		if self.nmiss == 0 or self.nmiss == 3 or self.nmiss == self.ncann:
			return False
		else:
			return True

# PART B starts from here

# The next 10 methods are the state change operators.
# Each one first tests that it can be applied. 
# If so, it returns the new state.
# Otherwise, it returns the bad state (-1, -1, 'M')
#
# MCR sends the boat from left to right with one missionary and one cannibal
#
   def MCR(self):
		#WRITE SOME CODE HERE
		self.nmiss -= 1
		self.ncann -= 1
		if self.illegal() == False:
			self.nmiss += 1
			self.ncann += 1
			return State(self.nmiss-1, self.ncann-1, 'R')
		else:
			self.nmiss += 1
			self.ncann += 1
			
			return State(-1, -1, 'M')

#
# MMR sends the boat from left to right with two missionaries in it
#
   def MMR(self):
		#WRITE SOME CODE HERE
		self.nmiss -= 2
		if self.illegal() == False:
			self.nmiss += 2
			return State(self.nmiss-2, self.ncann, 'R')
		else:
			self.nmiss += 2
			
			return State(-1, -1, 'M')

# 
# MR sends the boat from left to right with one missionary in it
#
   def MR(self):
		#WRITE SOME CODE HERE
		self.nmiss -= 1
		if self.illegal() == False:
			self.nmiss += 1
			return State(self.nmiss-1, self.ncann, 'R')
		else:
			self.nmiss += 1
			
			return State(-1, -1, 'M')
#
# CCR sends the boat from left to right with two cannibals in it
#
   def CCR(self):
		#WRITE SOME CODE HERE
		self.ncann -= 2
		if self.illegal() == False:
			self.ncann += 2
			return State(self.nmiss, self.ncann-2, 'R')
		else:
			self.ncann += 2
			
			return State(-1, -1, 'M')

#
# CR sends the boat from left to right with one cannibal in it
#
   def CR(self):
		#WRITE SOME CODE HERE
		self.ncann -= 1
		if self.illegal() == False:
			self.ncann += 1
			return State(self.nmiss, self.ncann-1, 'R')
		else:
			self.ncann += 1
			
			return State(-1, -1, 'M')

#
# MCL sends the boat from right to left with one missionary and one cannibal
#
   def MCL(self):
		#WRITE SOME CODE HERE
		self.nmiss += 1
		self.ncann += 1
		if self.illegal() == False:
			self.nmiss -= 1
			self.ncann -= 1
			return State(self.nmiss+1, self.ncann+1, 'L')
		else:
			self.nmiss -= 1
			self.ncann -= 1
			
			return State(-1, -1, 'M')

#
# MML sends the boat from right to left with two missionaries in it
#
   def MML(self):
		#WRITE SOME CODE HERE
		self.nmiss += 2
		if self.illegal() == False:
			self.nmiss -= 2
			return State(self.nmiss+2, self.ncann, 'L')
		else:
			self.nmiss -= 2
			
			return State(-1, -1, 'M')

# 
# ML sends the boat from right to left with one missionary in it
#
   def ML(self):
		#WRITE SOME CODE HERE
		self.nmiss += 1
		if self.illegal() == False:
			self.nmiss -= 1
			return State(self.nmiss+1, self.ncann, 'L')
		else:
			self.nmiss -= 1
			
			return State(-1, -1, 'M')

#
# CCL sends the boat from right to left with two cannibals in it
#
   def CCL(self):
		#WRITE SOME CODE HERE
		self.ncann += 2
		if self.illegal() == False:
			self.ncann -= 2
			return State(self.nmiss, self.ncann+2, 'L')
		else:
			self.ncann -= 2
			
			return State(-1, -1, 'M')

#
# CL sends the boat from right to left with one cannibal in it
#
   def CL(self):
		#WRITE SOME CODE HERE
		self.ncann += 1
		if self.illegal() == False:
			self.ncann -= 1
			return State(self.nmiss, self.ncann+1, 'L')
		else:
			self.ncann -= 1
			
			return State(-1, -1, 'M')

# PART B ends here


#
# This method miscan() is the main program that initializes variables
# and calls the recursive search procedure mcsearch
#
def miscan():
   global bad
   bad = State(-1, -1, 'M')
   start = State(3,3,'L')
   path = []
   path.insert(0, start)
   mcsearch(start, path)

#
#
# mcsearch is the recursive depth-first search procedure
#
def mcsearch(s, path):

#
# If it is at a goal state, it inserts that state in the path and
# calls on the output method, and returns
#
#
   #if it is a goal state
	if s.goal():
		#path.append(s)
		print 'solution found!'
		printResult(path)
		print
		return

#
# If it is at an illegal state, just return
#
	if s.describe() == bad.describe():
		return
	
#
# Otherwise:
# 1) call expand to get the children
# 2) for each child:
#	a)push it on the path
#	b)recursively continue the search with the child
#	c)pop it off the path
#
	children = expand(s)
	# main loop
	for single in children:
		#check if the object is duplicated in path
		if notDuplicate(single, path):
			path.append(single)
			mcsearch(single, path)
			path.pop()

# function for checking duplicates
def notDuplicate(s, path):
	for single in path:
		if single.describe() == s.describe():
			return False
	return True

#
# expand calls expandL when the current state is on the left
# and expandR when it is on the right
#
def expand(s):
	#print 'got expanded'
	if s.bside == 'R':
		return expandR(s)
	else:
		return expandL(s)
#
# expandL expands a state that is on the left.
# It tries each of the five possible operators for the left,
# putting the states returned by those that succeed
# on a list called children, which it returns.
#
#func_list = [MCR, MMR, MR, CCR, CR] 

# function for printing solution
def printResult(rlist):
	print "["+str(rlist[0].describe()),
	for x in range(1, len(rlist)-1):
		print rlist[x].describe()+",",
	print str(rlist[-1].describe())+"]\n"

def expandL(s):
	#store result and return
	return [s.MCR(), s.MMR(), s.MR(), s.CCR(), s.CR()] 



#
# expandR expands a state that is on the right.
# It tries each of the five possible operators for the right,
# putting the states returned by those that succeed
# on a list called children, which it returns.
#
def expandR(s):
	#store result and return 
	return [s.MCL(), s.MML(), s.ML(), s.CCL(), s.CL()] 

# main function call
miscan()




