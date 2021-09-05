#graph.txt
#6 5
#1 2
#1 4
#1 3
#2 4
#3 4

graph = {}
f = open ("graph.txt", 'r')
aline = f.readline()
n, m = aline.split(' ')

n = int(n) #vertex
m = int(m) #edge
for i in range(n): # graph에 vertex를 저장
    graph[i+1] = []

for i in range(m) : # graph에 edge를 저장
    aline = f.readline()
    n1, n2 = aline.split(' ')
    n1 = int(n1)
    n2 = int(n2)
    print(n1, n2)
    graph[n1].append(n2)
    graph[n2].append(n1)

for i in range(n):
    graph[i+1].sort()

print(graph)

visited = []

def dfs (graph, v):
    visited.append(v)
    print(v)

    for node in graph[v]:
        if node not in visited:
            dfs(graph, node)

for i in range(n):
    if (i+1 not in visited):
        dfs(graph, i+1)
