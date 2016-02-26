class Node:
    def __init__(self, v):
        self.value = v
        self.neighbors = []

    def other(self, y):
        self.y = 6

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
def dfs(start_node, stack, collector):
    visited[start_node] = True
    stack.append(start_node)
    collector.append(start_node)
    for n in start_node.neighbors:
        if visited[n]:
            next
        else:
            dfs(n, stack, collector)
            stack.pop()

stack = []
collector = []

dfs(na, stack, collector)

print('Order visited:')
for n in collector:
    print(n.value)
