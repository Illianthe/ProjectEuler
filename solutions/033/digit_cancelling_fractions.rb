# Problem #33 - Digit Cancelling Fractions

require "../../lib/integer.rb"

def digit_cancelling_fractions
  # Find the non-trivial fractions with 2 digits in the numerator and denominator
  total_numerator = 1
  total_denominator = 1

  (10..99).each do |numerator|
    (numerator + 1).upto(99).each do |denominator|
      # Skip trivial examples
      next if numerator % 10 == 0 or denominator % 10 == 0

      # Find the common digit
      num_digits = numerator.to_digits
      denom_digits = denominator.to_digits
      common = (num_digits & denom_digits)[0]

      # Skip if there isn't a common digit
      next if common.nil?

      # "Cancel" the common digit, making sure it is only removed once
      num_digits.delete_at(num_digits.index(common))
      denom_digits.delete_at(denom_digits.index(common))
      n = num_digits[0]
      d = denom_digits[0]

      # Multiply by total if it fits the criteria
      if n.to_f/d == numerator.to_f/denominator
        total_numerator *= numerator
        total_denominator *= denominator
      end
    end
  end

  # We need to return the total in lowest common terms. Divide
  # the numerator and denominator by the GCD of both.
  gcd = total_numerator.gcd(total_denominator)
  total_numerator = total_numerator / gcd
  total_denominator = total_denominator / gcd

  return total_denominator
end

p digit_cancelling_fractions