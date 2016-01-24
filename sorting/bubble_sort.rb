def swap(arr, idx, idx_n)
  tmp = arr[idx]
  arr[idx] = arr[idx_n]
  arr[idx_n] = tmp
end

def bubble_sort_iteration(arr)
  num_swaps = 0
  arr.each_with_index do |n, idx|
    next if idx + 1 == arr.count
    next_n = arr[idx + 1]
    if n > next_n
      swap(arr, idx, idx + 1)
      num_swaps += 1
    end
  end
  num_swaps
end

def bubble_sort(arr)
  loop until bubble_sort_iteration(arr) == 0
  arr
end

puts bubble_sort [6, 1, 9, 15, 1, 2, 7, 3, 19, 2, 17]
