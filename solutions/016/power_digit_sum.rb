# Problem #16 - http://projecteuler.net/problem=16

def power_digit_sum
  # It feels like I'm cheating here since Ruby can easily handle *large* numbers.
  # However, we can make use of the solution for #13 and note that
  # 2 ** 1000 == 2 ** 999 * 2 == 2 ** 999 + 2 ** 999.
  digits = (2 ** 1000).to_s.split("")
  return digits.inject(0) { |sum, x| sum += x.to_i }
end

p power_digit_sum