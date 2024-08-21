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
    n=intinput()
    values=string()
    i=0
    j=n-1
    temp=set()
    while i<j:
        
        if values[j]=='0':
            while i<j and values[i]!='1':
                i+=1
            if values[j]=='0' and values[i]=='1':
                temp.add(i+1)
                temp.add(j+1)
            i+=1
            
        j-=1
    ans=sorted(list(temp))
    
    if ans :
        print(1)   
        print(len(ans),*ans)
    else:
        print(0)
                    
    
    
    
    
    



t = 1
t = intinput()
for _ in range(t):
    solution()
