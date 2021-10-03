import time

A, B, C = map(int, input().split())


def dnc(A, B):
    if B == 1:
        return A%C
    else:
        num = dnc(A, B//2)
        if B%2 == 0:
            #곱셈이 짝수 번 이루어질 때
            
            return num*num%C
        else:
            #곱셈이 홀수 번 이루어질 때
            return num*num*A%C

start = time.time()
print(dnc(A, B))
end = time.time()

#print(f"{end - start:.5f} sec")
