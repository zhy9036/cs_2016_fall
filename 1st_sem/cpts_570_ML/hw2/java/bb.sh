#!/bin/bash


#java -classpath libsvm.jar svm_train -t 0 -c $c ./data/"fold1_sm_test.txt" ./modelFiles/"model1"
       
for i in {2..4}
do
	echo $i
	for j in {0..9}
	do
		java -classpath libsvm.jar svm_predict ./data/"fold$(($j))_sm_validation.txt" ./modelFiles/"polymodel$(($i))$(($j))" ./output_poly/"validation_polyoutput$(($i))$(($j))" 
		#pwd
	done
done