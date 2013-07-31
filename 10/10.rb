# Problem #10 - Summation of primes

require "../lib/utility.rb"
include Utility

def summation_of_primes(max)
  sum = 0
  (2..max).each do |i|
    sum += i if is_prime? i
  end
  sum
end

# This solution uses the Sieve of Eratosthenes to solve
# this problem a bit more elegantly. See: http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
def summation_of_primes_2(max)
  sieve = Array.new(max, true)
  sieve[0] = sieve[1] = false    # 0 and 1 aren't primes
  sum = 0

  p = 2
  while p < sieve.size
    # Mark all composites off
    k = 1
    while k * p < max
      sieve[k * p] = false
      k += 1
    end

    sum += p

    # Find next prime
    while !sieve[p] and p < sieve.size
      p += 1
    end
  end

  sum
end

p summation_of_primes_2(2000000)