import sys
import numpy as np
import random_search_fram
import sarsa_L
import gym

env                 = "StochasticMDPGridWorld-v0"   #Environment Used
para_set            = [0.5, 0.3, 0.5, 0.5]          #Parameters: Lambda, Epsilon, Gamma, Alpha
itrPerDataPoint     = 10                            #Number of times the learning alg will be run to produce average result
EpLimit             = 2000                          #Number of Max number of episodes. episode increment for learning curve = EpLimit/dataPointcount
dataPointCount      = 10                            #Number of datapoints in the learning curve
cutOff              = 100                           #Number of results, counting from end of the run, to be averaged for a single sarsaL result.

debug = False

def sarsa(para_set):
    result  = sarsa_L.sarsa_L(para_set, env, itrPerDataPoint, EpLimit, cutOff)
    if debug:
        print "sarsa result = {}".format(result)
    return result


def prettyPrintResult(param_set, reward_set, param_name):
    print "============================================="
    print"param_name:  {}".format(param_name)
    print"param_value:   ", param_set
    print "reward_value: ", reward_set
    print "============================================="

def runAll():
    Lambda, reward = random_search_fram.random_search(para_set, 0, (0, 1), sarsa)
    prettyPrintResult(Lambda, reward, "Lambda")

    Epsilon, reward = random_search_fram.random_search(para_set, 1, (0, 0.5), sarsa)
    prettyPrintResult(Epsilon, reward, "Epsilon")

    Gamma, reward = random_search_fram.random_search(para_set, 2, (0, 1), sarsa)
    prettyPrintResult(Gamma, reward, "Gamma")

    Alpha, reward = random_search_fram.random_search(para_set, 3, (0, 1), sarsa)
    prettyPrintResult(Alpha, reward, "Alpha")

    learnCurv, Ep_List = sarsa_L.LearningCurve((Lambda, Epsilon, Gamma, Alpha), env, itrPerDataPoint, EpLimit, cutOff, dataPointCount)
    print "Learning Curve:"
    print learnCurv
    print Ep_List

runAll()