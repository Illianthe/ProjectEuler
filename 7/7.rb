# Problem #7

require "../lib/utility.rb"
include Utility

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

p nth_prime(10001)