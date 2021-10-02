N = int(input())
paper = [list(map(int, input().split())) for _ in range(N)]
white = 0
blue = 0

#a 세로 b 가로 N전체크기
def cut(a, b, N):
    global white, blue
    color = paper[a][b]
    
    
    for i in range(a, a+N):
        for j in range(b, b+N):
            if paper[i][j] != color : #하나라도 다른 색이 있는 경우
                cut(a, b, N//2)
                cut(a, b+N//2, N//2)
                cut(a+N//2, b, N//2)
                cut(a+N//2, b+N//2, N//2)
                return
    if color == 0:
        white += 1
    else:
        blue += 1


cut(0, 0, N)
print(white)
print(blue)
