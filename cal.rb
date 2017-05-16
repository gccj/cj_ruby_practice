# 入力された年の月の1日の曜日を計算
# ツェラーの公式を使用
# year:入力された年
# month:入力された月
# c: 世紀
# y: 年（後ろ2位）
# d:日　今回はついたちの日に指定する
# 返り値：曜日（0:日 1:月 2:火 3:水 4:木 5:金 6:土）

def calc_day(year, month, day = 1)
  # 1月, 2月は前年の13月, 14月として計算
  c = year / 100
  y = year % 100
  m = month
  d = day
  if m == 1 || m == 2
    m += 12
    y -= 1
  end

  # ツェラーの公式用の数を求める
  # w = y + y / 4 + c / 4 - 2 * c + 13 * (m + 1) / 5 + d - 1

  # 曜日計算
  offset = y + y / 4 + c / 4 - 2 * c + 13 * (m + 1) / 5 + d - 1
  offset += 7 if offset < 0
  offset %= 7
  offset
end

# うるう年かどうかを判定する

def leap_year?(year)
  if (year % 400).zero?
    true
  elsif (year % 100).zero?
    false
  elsif (year % 4).zero?
    true
  else
    false
  end
end

def calendar(offset, month_length)
  [*1..month_length].unshift(*Array.new(offset)).each_slice(7).map do |week|
    week.map { |day| '%3s' % day }.join ' '
  end.unshift %w[日 月 火 水 木 金 日].map { |wday| '%3s' % wday }.join ''
end

def title(year, month)
  '　　　　　%d年%d月' % [year, month]
end

def print_calendar(year, month)
  now = Time.now
  year = now.year if year.zero?
  month = now.month if month.zero?
  year_days = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  leap_year_days = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  month_length = leap_year?(year) ? leap_year_days[month] : year_days[month]
  offset = calc_day(year, month)
  puts title year, month
  puts calendar offset, month_length
end

year = ARGV[0].to_i
month = ARGV[1].to_i

print_calendar year, month
