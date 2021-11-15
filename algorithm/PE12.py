n, k = map(int, input().split())
coin = []

#입력 받아 list에 넣음
for i in range(0, n):
    ex = int(input())
    coin.append(ex)

coin.reverse() #coin리스트 리버스
count = 0

for i in coin:
    if k < i:
        continue
    else:
        count+= k//i
        k = k%i
        if k!=0:
            continue
        else:
            break

print(count)
