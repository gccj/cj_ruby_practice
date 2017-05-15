text_array = ARGV
@count = 0
text_array.each do |text|
  @count += 1 if text.size !=1 && text[0] == text[-1]
end

puts @count