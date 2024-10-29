# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
import numpy as np
import pandas as pd

Q = list(' GCTGGAAGGCAT')
P= list(' GCAGAGCACG')

arr = np.zeros((len(P), len(Q)))
match = 5
mismatch = -4
gap = -4

for i in range(1, len(P)):
    for j in range(1, len(Q)):

        if Q[j] == P[i]:
            s_diag = arr[i-1, j-1] + match
            
        else:
            s_diag = arr[i-1, j-1] + mismatch
        s_tb = arr[i, j-1] + gap 
        s_lr = arr[i-1, j] + gap
        arr[i,j] = max(s_tb, s_lr, s_diag, 0)
        
        
result = pd.DataFrame(arr, columns = Q, index = P)


