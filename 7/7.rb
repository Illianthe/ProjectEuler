# Problem #7

def nth_prime(n)
  found = 0
  current = 2
  while found <= n
    if is_prime? current
      found += 1
      return current if found == n
    end
    current += 1
  end
end

# Checks if a number is prime via trial division
def is_prime?(n)
  (2..Math.sqrt(n).floor).each do |i|
    return false if n % i == 0
  end
  true
end

p nth_prime(10001)