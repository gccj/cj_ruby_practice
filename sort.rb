def quick_sort(array)
  return array if array.empty?
  pivot = array[0]
  left = []
  right = []
  [*1..array.length - 1].each do |i|
    if array[i] <= pivot
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

# 　ruby sort.rb [1,2,4,10,30,20,3,5,6](1,2,4,10,30,20,3,5,6 / 1 2 4 10 30 20 3 5 6)
array = ARGV
array[0] ||= '[4,3,5,1,2]'
array = array[0].slice(1..-2).split(',') if array[0].include? '['
array = array[0].split(',') if array[0].include? ','
array.map!(&:to_i)
array = my_sort(array)
print array
puts
