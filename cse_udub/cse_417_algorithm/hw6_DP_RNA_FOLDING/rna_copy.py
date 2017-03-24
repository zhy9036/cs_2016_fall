"""
Yang Zhang
CSE 417 HW 6 DYNAMIC PROGRAMMING
RNA FOLDING
"""

import sys,string
from numpy import *
from matplotlib import *

#read sequences
#sequences are stored in many lines
f=open(sys.argv[1], 'r')
seq=[]
for line in f.readlines():
    seq.append(string.strip(line))

def check_pair(l,m,i,j):
    if j - i > 4:
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
    return 0

def buildDP(seq):

    rna_len=len(seq)
    s=zeros((rna_len,rna_len))
    for n in xrange(1,rna_len):
        for j in xrange(n,rna_len):
            i=j-n
            case1=s[i+1,j-1]+check_pair(seq[i],seq[j],i,j)
            case2=s[i+1,j]
            case3=s[i,j-1]
            
            if i+3<=j:
                tmp=[]
                for k in xrange(i+1,j):
                    tmp.append(s[i,k]+s[k+1,j])
                    case4=max(tmp)
                    s[i,j]=max(case1,case2,case3,case4)
            else:
                s[i,j]=max(case1,case2,case3)
            
    return s

def traceback(s,seq,i,j,pair):
    if i<j:
        if s[i,j]==s[i+1,j]:
            traceback(s,seq,i+1,j,pair)
        elif s[i,j]==s[i,j-1]:
            traceback(s,seq,i,j-1,pair)
        elif s[i,j]==s[i+1,j-1]+check_pair(seq[i],seq[j],i,j):
            pair.append([i,j,str(seq[i]),str(seq[j])])
            traceback(s,seq,i+1,j-1,pair)
        else:
            for k in xrange(i+1,j):
                if s[i,j]==s[i,k]+s[k+1,j]:
                    traceback(s,seq,i,k,pair)
                    traceback(s,seq,k+1,j,pair)
                    break
    return pair

for q in xrange(0,len(seq)):
    pair=traceback(buildDP(seq[q]),seq[q],0,len(seq[q])-1,[])
    print pair 
    print "max # of folding pairs: ",len(pair)
    for x in xrange(0,len(pair)):
        print '%d %d %s==%s' % (pair[x][0],pair[x][1],pair[x][2],pair[x][3])
    print "---"