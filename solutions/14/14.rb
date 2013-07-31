# Problem #14 - http://projecteuler.net/problem=14

# Approach: we use memoization to save computed chain lengths
def longest_collatz_sequence
  chain_sizes = Hash.new
  chain_sizes[1] = 1

  # Find the largest starting number that results in the longest chain
  highest = [1, 1]
  (2..999999).each do |i|
    calculate_chain_size(i, chain_sizes)
    if chain_sizes[i] > highest[1]
      highest = [i, chain_sizes[i]]
    end
  end

  highest[0]
end

# Recursively calculates sizes and stores the result
def calculate_chain_size(i, sizes)
  return sizes[i] if !sizes[i].nil?

  n = i
  if n % 2 == 0
    n = n / 2
  else
    n = 3 * n + 1
  end

  sizes[i] = calculate_chain_size(n, sizes) + 1
end

p longest_collatz_sequence