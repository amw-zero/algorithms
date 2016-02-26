def swap(a, i, j):
    a[i], a[j] = a[j], a[i]

a = [1, 3, 4, 2, 8, 4, 5, 1, 10, 6, 8, 9, 25, 15, 13, 12, 18, 17, 3, 5, 2, 7]

def _bubble_sort(a):
    num_iterations = 0
    for i, n in enumerate(a):
        if i == len(a) - 1:
            continue
        if a[i] > a[i + 1]:
            num_iterations += 1
            swap(a, i, i + 1)

    return num_iterations

def bubble_sort(a):
    while True:
        num_iterations = _bubble_sort(a)
        if num_iterations == 0:
            break

print(a)
bubble_sort(a)
print(a)
