# Problem #32

require "../../lib/integer.rb"
require "../../lib/array.rb"

# Approach: We note that we can set an upper bound and lower bound
# to this problem. Because the multiplier/multiplicand/product must
# each have at least one digit, the product can have at most 7 digits.
# We can narrow this further by observing that when a multiplicand is
# multiplied by its multiplier, the number of the digits in the product
# is >= the multiplicand + the multiplier - 1. For example,
# 100 * 10 == 1000. This removes the possibility of the product ever
# having <= 3 digits. We also determine that the relationship can never
# hold for products of >= 5 digits as any permutation of the remaining
# 4 digits or so is less than that: max(9 * 999, 99 * 99) == 9801
def pandigital_products
  digits = (1..9).to_a
  products = Hash.new

  # For each product, see if we can find a permutation of 
  # multipliers/multiplicands that hold.
  (1000..9999).each do |product|
    product_digits = product.to_digits
    remaining_digits = digits.reject { |i| product_digits.include? i }
    next if remaining_digits.length != 5

    1.upto(remaining_digits.length - 1) do |n|
      possible_multiplicands = remaining_digits.permutation(n)
      possible_multiplicands.each do |multiplicand|
        possible_multipliers = remaining_digits.reject { |i| multiplicand.include? i }.permutation
        possible_multipliers.each do |multiplier|
          products[product] = true if multiplier.to_i * multiplicand.to_i == product
        end
      end
    end
  end

  products.inject(0) { |sum, (key, value)| sum + key }
end

p pandigital_products