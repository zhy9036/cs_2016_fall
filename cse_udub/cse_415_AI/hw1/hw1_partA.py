'''
Yang Zhang
CSE 415 HW1
part A
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
