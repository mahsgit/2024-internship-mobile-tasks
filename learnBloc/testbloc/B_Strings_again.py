import sys


def intinput():
    return int(sys.stdin.readline().strip())


def string():
    return sys.stdin.readline().strip()


def listinput():
    return list(map(int, sys.stdin.readline().strip().split()))


def digitslist():
    return [int(i) for i in (list(sys.stdin.readline().strip()))]


def listchar():
    return list(sys.stdin.readline().strip())



def solution():
    n,m,k=listinput()
    val1=listchar()
    val2=listchar()
    val1.sort()
    val2.sort()
    ans=''
    i=0
    j=0
    c=k
    print(val2)
    print(val1)
    flag=False
    def bound(l,r):
        return 0<=l<len(val1) and 0<=r<len(val2)
    
    while bound(i,j):
        while  bound(i,j) and not flag and val1[i] < val2[j] and c>0 :
            ans+=val1[i]
            c-=1
            i+=1
            flag=True
            
        if flag and j<len(val2):
            ans+=val2[j]
            j+=1
            c-=1
            flag=False
        while bound(i,j) and val1[i]>val2[j] and c>0 :
            ans+=val2[j]
            j+=1
            c-=1
            flag=False
            
            
        c=k
        
    print(ans)
            
    
    
    
    
    
    



t = 1
t = intinput()
for _ in range(t):
    solution()
