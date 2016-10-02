#!/bin/bash

c=0.0001  
#java -classpath libsvm.jar svm_train -t 0 -c $c ./data/"fold1_sm_train.txt" ./modelFiles/"model1"        
for i in {1..9}
do
	echo $c
	for j in {0..9}
	do
		java -classpath libsvm.jar svm_train -t 0 -c $c ./data/"fold$(($j))_sm_train.txt" ./modelFiles/"model$(($i))$(($j))"
		#pwd
	done
	c=$(echo "$c*10"|bc)
done
