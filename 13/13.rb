# Problem #13 - http://projecteuler.net/problem=13

# Approach: treat each digit as a value in an array and sum manually
def large_sum
  total = [0]

  File.open("number.txt").each_line do |line|
    # We reverse the number first - this puts the least significant
    # digit at the front of the array
    number = line.chomp.reverse.split("").map { |i| i.to_i }
    new_total = []

    carry = 0
    while total.count > 0 or number.count > 0 or carry > 0
      first = total.shift || 0
      second = number.shift || 0
      sum = first + second + carry
      digit = sum % 10
      carry = (sum - digit) / 10
      new_total << digit
    end

    total = new_total
  end

  total
end

# First 10 digits of the sum
p large_sum.reverse[0..9].inject(0) { |result, i| result * 10 + i }