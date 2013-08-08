# Problem #27 - http://projecteuler.net/problem=27

require "../../lib/utility.rb"
include Utility

def quadratic_primes
  largest = 0

  (-999).upto(999) do |a|
    (-999).upto(999) do |b|
      n = 0
      result = n ** 2 + a * n + b
      while result > 1 and is_prime?(result)
        n += 1
        result = n ** 2 + a * n + b
      end
      largest = [a, b, n] if n > largest[2]
    end
  end

  return largest[0] * largest[1]
end

p quadratic_primes