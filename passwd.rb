pw_length = ARGV[0].to_i

array = [*0..9, *'a'..'z', *'A'..'Z']

puts array.sample(pw_length).join('')