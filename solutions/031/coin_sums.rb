# Problem #31

def coin_sums(n)
  return calculate_possibilities(n, [1, 2, 5, 10, 20, 50, 100, 200])
end

def calculate_possibilities(n, coins)
  return 0 if n < 0
  return 1 if n == 0

  possibilities = 0
  possibilities += calculate_possibilities(n, coins[1..(coins.length - 1)]) if coins.length > 1
  possibilities += calculate_possibilities(n - coins[0], coins)
  return possibilities
end

p coin_sums(200)