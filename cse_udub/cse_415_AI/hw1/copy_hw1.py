#
# This is a Python program to find all solutions to the Missionary-Cannibal
# Problem using a blind depth-first search with a stack keeping track of
# the path from the root to the current state.
#
# There are 3 missionaries and 3 cannibals and a boat that holds 2 people.
# Each state is of the form(nmiss, ncann, bside).
# nmiss is the number of missionaries on the left side of the river.
# ncann is the number of cannibals on the left side of the river.
# bside is the side of the river that the boat is on: 'L' or 'R'
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
		#WRITE SOME CODE HERE
		if self.nmiss<0 or self.nmiss>3 or self.ncann<0 or self.ncann>3:
			return True
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
			self.bside = 'R'
			return self
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
			self.bside = 'R'
			return self
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
			self.bside = 'R'
			return self
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
			self.bside = 'R'
			return self
		else:
			self.ncann += 2
			
			return State(-1, -1, 'M')

#
# CR sends the boat from left to right with one cannibal in it
#
   def CR(self):
		#WRITE SOME CODE HERE
		#WRITE SOME CODE HERE
		self.ncann -= 1
		if self.illegal() == False:
			self.bside = 'R'
			return self
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
			self.bside = 'L'
			return self
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
			self.bside = 'L'
			return self
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
			self.bside = 'L'
			return self
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
			self.bside = 'L'
			return self
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
			self.bside = 'L'
			return self
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
   test1 = State(0,3,'L')
   test2 = State(2,2,'R')
   #print start.bside == 'L'
   #print test2.bside == 'R'
   #print test1.illegal()
   #print test2.illegal()
   path = []
   path.insert(0, start)
   mcsearch(start, path)
   #printResult(path)

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
   #print 'inside mcsearch'
   #if it is a goal state
	if s.goal():
		#path.append(s)
		print 'solution found!'
		printResult(path)
		print
		return path

#
# If it is at an illegal state or repeated state, just return
#
   #if it is an illegal state or repeated state
	#if checkDuplicate(s,path) or s.describe() == bad.describe():

		#print 'got repeated or illegal ' +  s.describe()
		#printResult(path)

		#return path
   
#
# Otherwise:
# 1) call expand to get the children
# 2) for each child:
#	a)push it on the path
#	b)recursively continue the search with the child
#	c)pop it off the path
#
	children = expand(s)
	for single in children:
		if notDuplicate(single, path):
			path.append(single)
			#printResult(path)
			mcsearch(single, path)
			path.pop()


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

def printResult(rlist):
	for element in rlist:
		print element.describe(),
	print

def expandL(s):
 		#WRITE SOME CODE HERE
 		# make 5 copies current state
	s1 = copy.deepcopy(s)
	s2 = copy.deepcopy(s)
	s3 = copy.deepcopy(s)
	s4 = copy.deepcopy(s)
	s5 = copy.deepcopy(s)
	func_list = [s1.MCR, s2.MMR, s3.MR, s4.CCR, s5.CR] 
	children = []
	for x in range(0,5):
		temp = func_list[x]()
		if temp.describe() != bad.describe():
			children.append(temp)
	return children


#
# expandR expands a state that is on the right.
# It tries each of the five possible operators for the right,
# putting the states returned by those that succeed
# on a list called children, which it returns.
#
def expandR(s):
 		# make 5 copies current state
	s1 = copy.deepcopy(s)
	s2 = copy.deepcopy(s)
	s3 = copy.deepcopy(s)
	s4 = copy.deepcopy(s)
	s5 = copy.deepcopy(s)
	func_list = [s1.MCL, s2.MML, s3.ML, s4.CCL, s5.CL] 
	children = []
	for x in range(0,5):
		temp = func_list[x]()
		if temp.describe() != bad.describe():
			children.append(temp)
	return children

#
miscan()




