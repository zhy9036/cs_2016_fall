"""
Yang Zhang
CSE 417 HW 6 DYNAMIC PROGRAMMING
RNA FOLDING
"""

import sys,string,time
#from numpy import *
#from matplotlib import *



def check_pair(l,m):
    if l=='A' and m=='U':
        return 1
    elif l=='U' and m=='A':
        return 1
    elif l=='G' and m=='C':
        return 1
    elif l=='C' and m=='G':
        return 1
    else:
        return 0

def build_martix(size):
    m = []
    for x in xrange(0,size):
        temp = []
        for y in xrange(0,size):
            temp.append(0)
        m.append(temp)
    return m

def buildDP(seq):

    rna_len=len(seq)
    s=build_martix(rna_len)
    for n in xrange(5,rna_len):
        for j in xrange(n,rna_len):
            i=j-n
            case1=s[i+1][j-1]+check_pair(seq[i],seq[j])
            case2=s[i+1][j]
            case3=s[i][j-1]
            
            if i+4<=j:
                tmp=[]
                for k in xrange(i+1,j):
                    tmp.append(s[i][k]+s[k+1][j])
                    case4=max(tmp)
                    s[i][j]=max(case1,case2,case3,case4)
            else:
                s[i][j]=max(case1,case2,case3)
            
    return s

def traceback(opt,seq,i,j,pair):
    if i<j:
        # if i doesn't make a pair, traceback
        if opt[i][j]==opt[i+1][j]:
            traceback(opt,seq,i+1,j,pair)

        # else if j doesn't make a pair, traceback
        elif opt[i][j]==opt[i][j-1]:
            traceback(opt,seq,i,j-1,pair)

        # otherwise i, j must form a pair 
        elif opt[i][j]==opt[i+1][j-1] + 1:
            pair.append([i,j,seq[i],seq[j]])
            traceback(opt,seq,i+1,j-1,pair)
        
        else:
            for k in xrange(i+1,j):
                if opt[i][j]==opt[i][k]+opt[k+1][j]:
                    traceback(opt,seq,i,k,pair)
                    traceback(opt,seq,k+1,j,pair)
                    break

    return pair

#read sequences
#sequences are stored in many lines
f=open(sys.argv[1], 'r')
seq=[]
for line in f.readlines():
    seq.append(string.strip(line))

for q in xrange(0,len(seq)):

    t_start = time.time()

    opt = buildDP(seq[q])
    pair=traceback(opt,seq[q],0,len(seq[q])-1,[])
    #print pair 

    if len(seq[q]) < 26:
        for row in xrange(0, len(seq[q])):
            for col in xrange(0, len(seq[q])):
                print opt[row][col],
            print 
    print "max # of folding pairs: ",len(pair)
    print "seq: " + str(seq[q])
    

    left,right = [],[]
    for i in xrange(0,len(pair)):
        left.append(pair[i][0])
        right.append(pair[i][1])
    for j in xrange(0, len(seq[q])):
        if j in left:
            sys.stdout.write('(')
        elif j in right:
            sys.stdout.write(')')
        else:
            sys.stdout.write('.')

    total_time = round((time.time()-t_start)*1000*10000)/10000
    print "\n--- Run Time: "+str(total_time)+" ms"