# Problem #6

# Calculation done computationally
def sum_square_difference
  values = (1..100).to_a
  sum_of_squares = values.inject(0) { |result, element| result + element * element }
  sum = values.inject(0) { |result, element| result + element }
  square_of_sum = sum * sum
  return square_of_sum - sum_of_squares
end

# Calculation done using mathematical formulae
def sum_square_difference_2
  # Sum of consecutive squares (1..N) = N * (N + 1) * (2N + 1) / 6
  sum_of_squares = 100 * 101 * 201 / 6
  # Sum of consecutive numbers = N * (N + 1) / 2
  sum = 100 * 101 / 2
  square_of_sum = sum * sum
  return square_of_sum - sum_of_squares
end

# p sum_square_difference
p sum_square_difference_2