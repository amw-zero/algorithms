def indent_print(msg, depth)
	depth + 1.times { puts "  #{msg}" } if false
end

def merge_sort_imperative(arr, depth = 0)
	indent_print(arr, depth)
	if arr.length > 1
		mid 	= arr.size / 2
		left 	= arr[0...mid]
		right 	= arr[mid..arr.size]

		indent_print('left', depth)
		merge_sort(left, depth + 1)
		indent_print('right', depth)
		merge_sort(right, depth + 1)

		puts "Merging #{left}  --  #{right}"
		li = 0
		ri = 0
		ai = 0
		while li < left.size && ri < right.size
			if left[li] < right[ri]
				puts 'taking left'
				arr[ai] = left[li]
				li += 1
			else
				puts 'taking right'
				arr[ai] = right[ri]
				ri += 1
			end
			ai += 1
		end

		while li < left.size
			puts 'taking left overflow'
			arr[ai] = left[li]
			li += 1
			ai += 1
		end

		while ri < right.size
			puts 'taking right overflow'
			arr[ai] = right[ri]
			ri += 1
			ai += 1
		end

		puts "Done #{arr}"
	else

	end
end

arr = [8, 6, 10, 19, 3, 5, 1, 70, 2]
merge_sort_imperative(arr)
puts "#{arr}"