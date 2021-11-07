from collections import deque
#deque를 안 쓰면 시간복잡도가 박살난다고 한다

M, N = map(int, input().split())

#이차원리스트
graph = []
graph = [list(map(int, input().split())) for _ in range(N)]



queue = deque([])

dx = [-1, 1, 0, 0]
dy = [0, 0, -1, 1]

#토마토가 썩는 데 걸리는 최단일수

for i in range(N):
    for j in range(M):
        if graph[i][j] == 1:#썩은토마토
            queue.append([i,j])

def bfs():

    day = 0
    while queue:
        day+=1
        for i in range(len(queue)):
            x, y = queue.popleft()
        
            for i in range(4):
                nx = x + dx[i]
                ny = y + dy[i]
            
                if 0<=nx<N and 0<=ny<M: #범위 안에 있는 경우
                    if graph[nx][ny] == 0: #안 익었으면
                        graph[nx][ny] = 1 #익히기
                        queue.append([nx, ny])

    for i in range(len(graph)):
        for j in range(len(graph[i])):
            if graph[i][j] == 0:
                return -1
                            
    return day-1

print(bfs())
