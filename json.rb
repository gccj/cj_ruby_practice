hash_object = eval ARGV[0]

def print_hash_array(hash_array)
  hash_array.each do |hash|
    hash.each do |key, value|
      puts "  #{key}"
      puts "    #{value}"
    end
  end
end

hash_object.each do |key, value|
  puts key.to_s
  if value.is_a? Array
    print_hash_array value
  else
    puts "  #{value}"
  end
end
