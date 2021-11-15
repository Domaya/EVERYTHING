num = int(input())

coin = [500, 100, 50, 10, 5, 1]

k = 1000 - num
count = 0
for i in coin:
    if i > k:
        continue
    else:
        count += k//i
        k = k%i
        if k!=0:
            continue
        else:
            break
print(count)
