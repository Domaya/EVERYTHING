import sys
import heapq

input = sys.stdin.readline


INF = int(1e9) #무한을 의미하는 값으로 10억 설정

V, E = map(int, input().split())
graph=[[]*(V+1) for _ in range(V+1)]
distance = [INF] * (V+1) #최단거리 테이블 모두 무한으로 초기화

k = int(input()) #start node

for i in range(E):
    u, v, w = map(int, input().split())
    graph[u].append((v, w))

def dijkstra(start):
    queue = []

    heapq.heappush(queue, (0, start))
    distance[start]=0 #시작점 거리 0으로 초기화

    while queue:
        dist, now = heapq.heappop(queue)
        if distance[now] < dist:
            continue
        for i in graph[now]:
            cost = dist + i[1]
            if cost < distance[i[0]]:
                distance[i[0]] = cost
                heapq.heappush(queue, (cost, i[0]))

dijkstra(k)

for i in range(1, V+1):
    if distance[i] == INF:
        print("INF")
    else:
        print(distance[i])

