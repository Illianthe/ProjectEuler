module Utility
  # Checks if a number is prime via trial division
  def is_prime?(n)
    (2..Math.sqrt(n).floor).each do |i|
      return false if n % i == 0
    end
    true
  end
end