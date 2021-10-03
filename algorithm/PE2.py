N, r, c = map(int, input().split())

cnt = 0
r += 1
c += 1
while N>1:
    
    width = 1
    for i in range (0, N):
        width *= 2
        
    #이 순서(cnt)는 전체 N의 크기에 따라 달라진다
    #사분면을 크게 가르는 가운데..중심선을 기준으로 계산
    mid = (2 ** N) // 2 #중심선

    if r <= mid and c <= mid:
        #1구역
        pass
    elif r <= mid and c > mid:
        #2구역
        cnt += mid ** 2
        c -= mid
    elif r > mid and c <= mid:
        #3구역
        cnt += mid ** 2 * 2
        r -= mid
    elif r > mid and c > mid:
        #4구역
        cnt += mid ** 2 * 3
        r -= mid
        c -= mid
    N -=1


#이제 N=1의 사각형이 됨
if r == 1 and c == 1:
    print(cnt)
elif r == 1and c == 2:
    print(cnt + 1)
elif r == 2 and c == 1:
    print(cnt + 2)
elif r == 2 and c == 2:
    print(cnt + 3)
