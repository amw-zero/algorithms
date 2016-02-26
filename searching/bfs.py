class Node:
    def __init__(self, v):
        self.value = v
        self.neighbors = []

def print_visited(visited):
    print("Visited:")
    for k, v in visited.items():
        print('{}, {}'.format(k.value, v))

na = Node('a')
nb = Node('b')
nc = Node('c')
nd = Node('d')
ne = Node('e')
nf = Node('f')
ng = Node('g')
nh = Node('h')

all_nodes = [
    na, nb, nc,
    nd, ne, nf, ng, nh
]

na.neighbors.extend([nb, nd, ng])
nb.neighbors.extend([ne, nf])
nc.neighbors.extend([nf, nh])
nd.neighbors.extend([nf, na])
ne.neighbors.extend([ng, nb])
nf.neighbors.extend([nc, nd, nb])
ng.neighbors.extend([ne])
nh.neighbors.extend([nc])

visited = { n: False for n in all_nodes }
print_visited(visited)

queue = []
collector = []

def bfs(start_node, queue, collector):
    if not visited[start_node]:
        visited[start_node] = True
        collector.append(start_node)

    for n in start_node.neighbors:
        if visited[n]:
            next
        else:
            visited[n] = True
            collector.append(n)
            queue.insert(0, n)

    if len(queue) > 0:
        bfs(queue.pop(), queue, collector)

bfs(na, queue, collector)

for n in collector:
    print(n.value)
