# 1) Split array in half
# 2) Recurse on left and right halves
#    (this recursively divides into all of the pairs
#     in the array)
# 3) Loop over all common indexes, taking
#    lower values and replacing indexes in original array
# 4) Loop over overflow bounds, i.e. where left and right
#    are larger.
def merge_sort_imperative(arr, depth = 0)
  return if arr.length <= 1

  mid	= arr.size / 2
  left	= arr[0...mid]
  right	= arr[mid..arr.size]

  merge_sort_imperative(left, depth + 1)
  merge_sort_imperative(right, depth + 1)

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
end

arr = [1, 4, 2, 7, 0, 3, 10, 5, 6, 2]
merge_sort_imperative(arr)
puts arr.to_s
