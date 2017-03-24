'''
Yang Zhang
CSE 415 HW1
part B
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