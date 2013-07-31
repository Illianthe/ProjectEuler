# Problem #12 - http://projecteuler.net/problem=12

def divisible_triangle_number
  i = 1
  triangle_num = 1
  while generate_factors(triangle_num).count < 500
    i += 1
    triangle_num += i
  end
  triangle_num
end

# Generate an array of factors for a given number
def generate_factors(n)
  factors = []
  (1..Math.sqrt(n).floor).each do |i|
    if n % i == 0
      factors << i                      # First factor
      factors << n / i if n / i != i    # Second factor
    end
  end
  factors
end

p divisible_triangle_number