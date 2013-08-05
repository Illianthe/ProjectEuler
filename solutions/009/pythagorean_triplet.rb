# Problem #9

# Based off of Euclid's formula for generating tuples
# http://en.wikipedia.org/wiki/Pythagorean_triple
def pythagorean_triplet(sum)
  a, b, c = 0, 0, 0
  m = 2
  n = 1

  while a + b + c != sum
    a = m * m - n * n
    b = 2 * m * n
    c = m * m + n * n

    if n < m - 1
      n += 1
    else
      m += 1
      n = 1
    end
  end

  return a * b * c
end

p pythagorean_triplet(1000)