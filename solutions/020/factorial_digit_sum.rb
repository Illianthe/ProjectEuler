# Problem #20 - http://projecteuler.net/problem=20

def factorial_digit_sum
  return factorial(100).to_s.split("").inject(0) { |result, i| result + i.to_i }
end

def factorial(n)
  return 1 if n == 1
  return n * factorial(n - 1)
end

p factorial_digit_sum