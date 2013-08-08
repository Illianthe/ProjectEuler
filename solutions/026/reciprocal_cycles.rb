# Problem #26 - http://projecteuler.net/problem=26

def reciprocal_cycles
  cycle_length = Hash.new

  2.upto(999) do |i|
    numerators = []

    # The idea is to successively divide the remainder of n / i until
    # we notice that the sequence repeats. We multiply n by 10 so that
    # the integer portion is always >= 1. When n == 0, then there is no
    # recurring cycle as the decimal portion ends.
    numerator = 1
    while !(numerators.include? numerator) and numerator > 0
      while i > numerator
        numerators << numerator
        numerator = numerator * 10
      end
      numerator = numerator % i
    end

    # If numerator is 0, no cycle exists. Otherwise, we determine where the cycle starts
    # and count the elements from there.
    if numerator == 0
      cycle_length[i] = 0
    else
      cycle_length[i] = numerators.length - (numerators.index(numerator).nil? ? 0 : numerators.index(numerator))
    end
  end

  # Return the key with the longest repeating cycle
  largest_key = 0
  cycle_length.each do |key, value|
    largest_key = key if value > largest_key
  end
  return largest_key
end

p reciprocal_cycles