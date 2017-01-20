#!/bin/bash

for j in {0..9}
do
	java -classpath libsvm.jar svm_train -t 0 -c 0.1 ./data/"fold$(($j))_sm_fullTrain.txt" ./modelFiles/"fullModel$(($j))"
	#pwd
done