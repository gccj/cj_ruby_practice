def leap_year?(year)
  if (year % 400).zero?
    printf '%d, ' % year
  elsif (year % 100).zero?
    printf '%s,' % 'SKIP'
  elsif (year % 4).zero?
    printf '%d, ' % year
  end
end

(0..10_000).each do |year|
  leap_year? year
end
puts
