# See if search element is the middle element of array (floor of midpoint)
# If it is, that is the value 
# If it isn't, and the element is less than the middle element,
#   call binary_search on the subarray from index 0 to the middle index (all lower numbers)
# If it isn't, and the elemnt is greater than the middle element,
#   call binary_search on the subarray from the middle index to the end of the array (all higher numbers)

def binary_search(arr, n, num_iterations)
  mid = arr.count / 2

  if n == arr[mid]
    return n, num_iterations
  else
    num_iterations += 1
    if n < arr[mid]
      binary_search(arr[0..mid], n, num_iterations)
    else
      binary_search(arr[mid..arr.count], n, num_iterations)
    end
  end
end

a = []
100.times { |i| a << i}

[10, 20, 30, 40, 50, 60].each do |i|
  val, iterations = binary_search(a, i, 0)

  puts "Found #{val} in #{iterations} iterations"
  puts "log(#{a.count}) = #{Math.log(a.count)}"
end
