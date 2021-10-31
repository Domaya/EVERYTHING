import sys
sys.setrecursionlimit(10000)

def dfs(x,y):
    dx = [-1, 0, 1, -1, 1, -1, 0, 1]
    dy = [-1, -1, -1, 0, 0, 1, 1, 1]

    graph[x][y] = 0

    for i in range(8):
        nx = x + dx[i]
        ny = y + dy[i]

        if 0 <= nx < h and 0 <= ny < w and graph[nx][ny] == 1:
            dfs(nx, ny)

while True:
    w, h = map(int, input().split())
    graph = []
    cnt = 0

    if w == 0 and h == 0:
        break
    
    for i in range(0, h):
        graph.append(list(map(int, input().split())))

    for i in range(0, h):
        for j in range(0, w):
            #1인 애들에 대해서만 dfs
            if graph[i][j] == 1:
                dfs(i, j)
                cnt+=1
                
    print(cnt)

