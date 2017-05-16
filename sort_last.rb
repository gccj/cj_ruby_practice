def quick_sort(array)
  return array if array.empty?
  pivot = array[0]
  left = []
  right = []
  [*1..array.length - 1].each do |i|
    if array[i][-1] <= pivot[-1]
      left << array[i]
    else
      right << array[i]
    end
  end
  left = quick_sort(left)
  right = quick_sort(right)
  left + [pivot] + right
end

def my_sort(array)
  quick_sort(array)
end
array = [[1, 7], [1, 3], [3, 4, 5], [2, 2]]
array = my_sort(array)
print array
puts
