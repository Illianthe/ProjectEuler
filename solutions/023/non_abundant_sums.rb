# Problem #23 - http://projecteuler.net/problem=23

require '../../lib/utility.rb'
include Utility

def non_abundant_sums
  abundant_numbers = Hash.new(false)

  # Find all abundant numbers. We have an upper limit of 28111 because
  # we will only check for sums up to 28123 (and 12 is the smallest abundant #)
  (12..28111).each do |i|
    sum_of_divisors = proper_divisors(i).inject(:+)
    abundant_numbers[i] = true if sum_of_divisors > i
  end

  # Check to see if each integer can be written as a sum of two abundant #s.
  # Sum the ones that can't be.
  sum = 0
  (1..28123).each do |i|
    non_abundant = true
    abundant_numbers.each do |key, value|
      next if !value
      break if key > i

      difference = i - key
      if abundant_numbers[difference]
        non_abundant = false
        break
      end
    end
    sum += i if non_abundant
  end

  sum
end

p non_abundant_sums