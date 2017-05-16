text = ARGV[0]

def integer?(text)
  text =~ /^\d*\.\d+$/ ? '小数値が入力されました' : '小数値以外が入力されました'
end

puts integer?(text)
