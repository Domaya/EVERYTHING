v, e, s = map(int, input().split())

graph = [[]  for i in range(v+1)]#0번째 제외 1부터 해야되니까...

for i in range(e):
    a, b = map(int, input().split())
    graph[a].append(b)
    graph[b].append(a)


dfs_visited = []
bfs_visited = []

def dfs(graph, s):
    dfs_visited.append(s)
    graph[s].sort() #정렬하면 작은 수부터 시작되므로
    for i in graph[s]:
        if i not in dfs_visited:
            dfs(graph, i)
    return dfs_visited



def bfs(graph, s):
    queue = []
    queue.append(s)
    
    while queue:
        node = queue.pop(0)
        graph[node].sort()

        if node not in bfs_visited:
            bfs_visited.append(node)
            queue.extend(graph[node])

    return bfs_visited


def printList(arr):
    for i in arr:
        print(i, end= " ")
    print()
printList(dfs(graph, s))
printList(bfs(graph, s))
