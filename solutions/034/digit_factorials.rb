# Problem #34 - Digit Factorials

require "../../lib/integer.rb"
require "../../lib/utility.rb"

include Utility

# Approach: We first have to determine an upper bound for this problem.
# We note that 9! == 362880, so 6 digits is possible. Following this, we can
# have 999999 where 9! * 6 == 2177280, a 7 digit number. However, this can't go
# on much further as every subsequent digit we add after far exceeds what
# 9! adds to the running sum. Therefore, the upper bound is
# min(9999999, 9! * 7) == 2540160.
def digit_factorials
  sum = 0

  # Start with two digits as it's not considered a "sum" otherwise
  10.upto(2540160) do |i|
    factorial_sum = i.to_digits.map { |digit| factorial(digit) }.inject(:+)
    sum += i if factorial_sum == i
  end

  sum
end

p digit_factorials