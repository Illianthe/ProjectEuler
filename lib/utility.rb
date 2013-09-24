module Utility
  # Checks if a number is prime via trial division
  def is_prime?(n)
    (2..Math.sqrt(n).floor).each do |i|
      return false if n % i == 0
    end
    true
  end

  # Returns an array of all the proper divisors of n
  def proper_divisors(n)
    divisors = []
    (1..Math.sqrt(n).floor).each do |i|
      if n % i == 0
        divisors << i
        if (i > 1) and (n / i != i)
          divisors << n / i
        end
      end
    end
    divisors
  end

  def factorial(n)
    product = 1
    1.upto(n) do |i|
      product *= i
    end
    product
  end
end