from svm import *
from svmutil import *

def svmopt(c, g):

	y, x = svm_read_problem('./test/train')
	y1, x1 = svm_read_problem('./test/vali')
	m = svm_train(y, x, '-t 2 -c %f -g %f'%(c,g))

	p_label, p_acc, p_val = svm_predict(y1, x1, m)

	print '***********************************************************************'
	result = p_acc
	print result
	return 100-result[0]
	

def main(job_id, params):
	print 'Anything printed here will end up in the output directory for job #:', str(job_id)
	print params
	
	return svmopt(params['C'], params['G'])
	
#zhangyang@YANG-PC:/mnt/c/Users/Yang/Desktop/spearmint-master/spearmint/examples/test/svm/python$ ../../../../bin/spearmint ./config.pb --driver=local --method=GPEIOptChooser --method-args=noiseless=0
#(6.2838569880823405, 64.5622968580715, nan)