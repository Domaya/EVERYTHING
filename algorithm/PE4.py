v = int(input())
e = int(input())

graph = {}

for i in range(v):
    graph[i+1] = []

#v개만큼 노드 존재, e개만큼의 입력을 받는다

for i in range(0, e):
    a, b = map(int, input().split())
    graph[a].append(b)
    graph[b].append(a)


visited = []

cnt = 0

def dfs(graph, v):
    global cnt
    visited.append(v)
    for node in graph[v]:
        if node not in visited:
            dfs(graph, node)
            cnt+=1
    return cnt


print(dfs(graph, 1))
