from hw1_partA import *
if __name__ == "__main__":
   test1 = State(3,3,'L') # initial state
   test2 = State(0,0,'R') # goal state
   test3 = State(1,3,'R')
   test4 = State(2,1,'R')
   test5 = State(0,3,'R')

   if test1.describe() == '(3, 3, L)':
	print 'Method describe passed'
   else:
	print 'Method describe failed.\n should print:(3, 3, L), but you print:' + test1.describe()

   if not test1.goal() and test2.goal() and not test3.goal() and not test4.goal() and not test5.goal():
	print 'Goal method passed.'
   else:
   	print 'Goal method failed. Only State(0,0,\'R\') should return true.'

   if not test1.illegal() and not test2.illegal() and test3.illegal() and test4.illegal() and not test5.illegal():
	print 'Illegal method passed.'
   else:
	print 'Illegal method failed.\nExpect test1.illegal = false\n test2.illegal = false\n test3.illegal = true \n test4.illegal = true test5.illegal = false \n. But you print: test1.illegal = ' + str(test1.illegal) + '\n' + 'test2.illegal = ' + str(test2.illegal) + '\ntest3.illegal = ' + str(test3.illegal) + '\ntest4.illegal = ' + str(test4.illegal) + '\ntest5.illegal = ' + str(test5.illegal)