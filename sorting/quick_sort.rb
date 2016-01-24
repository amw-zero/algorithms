# 1) Choose Pivot - Choose a pivot index
#
# 2) Partition - Loop over the array, and position all lower 
#    elements to the left of the pivot, and highter
#    elements to the right of the pivot
#
# 3) Repeat - Recursively repeat until

# Returns [partd, pi]
# Where partd is the partitioned array
# and pi is the index of the pivot in 
# that array
def partition(a, p_fn)
	p = p_fn.call(a)

	partd = []
	lower = a.select { |i| i < p }
	higher = a.select { |i| i > p }
	partd += lower
	partd << p
	partd += higher
	a.replace(partd)
	a.index(p)
end

def swap(a, i1, i2)
	a[i1], a[i2] = a[i2], a[i1]
end

def partition_inplace(a, l, h, p_fn)
	p = p_fn.call(a, h)

	puts "pivot = #{p}"
	puts "l = #{l}, h = #{h}"

	i = l
	j = h

	while i <= j
		puts "Checking #{a[l..h]} | i = #{i}, j = #{j}"
		while a[i] <= p
			i += 1
		end
		while a[i] >= p
			j -= 1
		end
		
		if i <= j
			puts "Swapping #{a[i]} and #{a[j]}"			
			swap(a, i, j)
			i += 1
			j -= 1
		end
	end
	puts " *** This round of partitioning done. *** "
	i
end

def _quick_sort(a, l, h, p_fn)
	return if a.empty? || a.length == 1

	pi = partition_inplace(a, l, h, p_fn)
	puts "partd = #{a[l..h]}"
	puts
	sleep 0.5
	if l < pi - 1
		_quick_sort(a, l, pi - 1, p_fn)
	end
	if pi < h
		_quick_sort(a, pi, h, p_fn)
	end
end

def quick_sort(a, p_fn)
	_quick_sort(a, 0, a.length - 1, p_fn)
end

# 1) Choose first element as pivot
#
# 2) Loop over array. Swap numbers smaller
# than the pivot (or the pivot itself) to 
# the pivot pointer index, or "wall", i.e. 
# bring smaller numberes to the left of the wall
# and then increment the wall pointer. This way,
# you know everything left of the wall is smaller
# than the pivot.
def partition_lomuto(a, l, h)
	puts "Iteration l = #{l} | h = #{h}"
	pivot = a[h]
	pi = l
	l.upto(h - 1) { |i|
		if a[i] <= pivot
			swap(a, pi, i)
			pi += 1
		end
	}
	swap(a, pi, h)
	puts "Partitioned: #{a[l...pi]} |#{pivot}| #{a[pi + 1..h]}"
	pi
end

def _quicksort_lomuto(a, l, h)
	return if l >= h
	puts
	puts "Orig: #{a}"
	puts "Sorting #{a[l..h]}"

	pi = partition_lomuto(a, l, h)

	puts "Partition index: #{pi}"

	_quicksort_lomuto(a, l, pi - 1)
	_quicksort_lomuto(a, pi + 1, h)
end

def quicksort_lomuto(a)
	_quicksort_lomuto(a, 0, a.length - 1)
end

rand_pivot = proc { |a, h| rand(a.length) }
last_pivot = proc { |a, h| a[h] }

a = [10, 4, 6, 2, 1, 9, 10, 15, 3, 8, 2, 5]
quicksort_lomuto(a)
puts "#{a}"
