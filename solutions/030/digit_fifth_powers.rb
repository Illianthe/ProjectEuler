# Problem #30

# We first determine an upper bound for this problem. Since 9 ** 5 == 59049,
# we know that a five digit number is possible. Let's say each of the five digits
# are 9. Then 5 * (9 ** 5) == 295245, which is 6 digits. We repeat this process again:
# 6 * (9 ** 5) == 354294. This is the largest sum that can result from summing six digis
# raised to the power of 5. It is obvious from this pattern that we don't have to check
# numbers over 6 digits as the maximum sum is far less.
def digit_fifth_powers
  sum = 0
  0.upto(354294) do |i|
    fifth_powers = split_digits(i).map { |digit| digit ** 5 }
    sum_of_fifth_powers = fifth_powers.inject(:+)
    sum += sum_of_fifth_powers if sum_of_fifth_powers == i and sum_of_fifth_powers != 1
  end
  sum
end

def split_digits(n)
  digits = []
  while n > 0
    digits << n % 10
    n = (n / 10).floor
  end
  digits.reverse
end

p digit_fifth_powers