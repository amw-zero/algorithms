def swap(a, i, j):
	a[i], a[j] = a[j], a[i]

def partition(a, l, h):
	pivot = a[h]
	pi = l
	for i in range(l, h):
		if a[i] <= pivot:
			swap(a, i, pi)
			pi += 1

	swap(a, h, pi)
	print("After partitioning: l = {} | h = {}".format(l, h))
	print(a)
	return pi

def _quick_sort(a, l, h):
	if l >= h:
		return

	print('')
  	print('Orig: {}'.format(a))
  	print('Sorting {}'.format(a[l:h+1]))

	
	pi = partition(a, l, h)
	print("Partition index: {}".format(pi))
	_quick_sort(a, l, pi - 1)
	_quick_sort(a, pi + 1, h)

def quick_sort(a):
	_quick_sort(a, 0, len(a) - 1)

a = [1, 5, 3, 19, 12, 10, 2, 7, 20, 4, 24, 2, 9, 8]
quick_sort(a)



print(a)

