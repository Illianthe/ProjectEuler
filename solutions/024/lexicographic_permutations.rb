# Problem #24 - http://projecteuler.net/problem=24

def lexicographic_permuations
  # This naturally gives us a sorted array of permutations due to how we initialize it.
  # However, it is pretty inefficient as we're storing a *massive* array in memory.
  permutations = permute("0123456789")
  return permutations[999999]
end

def permute(string)
  return [string] if string.length == 1

  permutations = []
  (string.length).times do |i|
    # Take a letter from the string and generate all permutations from the remaining
    substr_1 = (i - 1 < 0) ? "" : string[0..(i - 1)]
    substr_2 = (i + 1 > string.length - 1) ? "" : string[(i + 1)..(string.length - 1)]
    permute(substr_1 + substr_2).each { |p| permutations << string[i] + p }
  end

  permutations
end

p lexicographic_permuations