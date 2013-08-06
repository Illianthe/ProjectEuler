# Problem #21

require "../../lib/utility.rb"
include Utility

def amicable_numbers
  d = Hash.new

  (1..9999).each do |i|
    d[i] = proper_divisors(i).inject(:+)
  end

  sum_of_amicable_numbers = 0
  (1..9999).each do |i|
    b = d[i]
    a = d[b]
    if a == i and a != b
      sum_of_amicable_numbers += i
    end
  end

  return sum_of_amicable_numbers
end

p amicable_numbers