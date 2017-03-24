"""
YANG ZHAGN 1030416 zhy9036@uw.edu
CSE 417 HW4
"""


from random import randint

rge = 20000
f = open('1000.txt', 'a')
for x in range(0, rge*2):
	coord = randint(0,1)
	f.write(str(coord)+' ')
f.close()