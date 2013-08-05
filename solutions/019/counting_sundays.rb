# Problem #19 - http://projecteuler.net/problem=19

# Approach: We generate the cumulative sum of each month from 1900 to 2000.
# Note that Sundays occur on the first of the month if that sum % 7 == 6 (since the first day lies on
# a Monday). We exclude the ones that occur in 1900 (since it's part of the 19th century).
def counting_sundays
  cumulative_sum = []

  (1900..2000).each do |year|
    (1..12).each do |month|
      cumulative_sum << days_in_month(month, year) + (cumulative_sum.last.nil? ? 0 : cumulative_sum.last)
    end
  end

  # Note that the cumulative sum represents the number of days before the start of each month
  # (i.e. cumulative_sum[0] == 31 == days before February 1900). Since we exclude the first
  # year, we count the number of Sundays from cumulative_sum[11..end]
  sundays = cumulative_sum[11..cumulative_sum.length - 1].inject(0) { |sum, e| (e % 7 == 6) ? sum + 1 : sum }
  return sundays
end

def days_in_month(month, year)
  leap = (year % 4 == 0) ? true : false
  leap = false if (year % 100 == 0) and (year % 400 != 0)

  if month == 2
    return leap ? 29 : 28
  elsif [4, 6, 9, 11].include? month
    return 30
  else
    return 31
  end
end

p counting_sundays