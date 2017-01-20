#!/bin/bash
for j in {0..9}
do
	java -classpath libsvm.jar svm_predict ./data/"fold$(($j))_sm_test.txt" ./modelFiles/"fullModel$(($j))" ./output_test_full/"fullOutput$(($j))" 
	#pwd
done