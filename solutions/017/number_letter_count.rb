# Problem #17 - http://projecteuler.net/problem=17

def number_letter_count
  letters = Hash[
    1 => 3,
    2 => 3,
    3 => 5,
    4 => 4,
    5 => 4,
    6 => 3,
    7 => 5,
    8 => 5,
    9 => 4,
    10 => 3,
    11 => 6,
    12 => 6,
    13 => 8,
    14 => 8,
    15 => 7,
    16 => 7,
    17 => 9,
    18 => 8,
    19 => 8,
    20 => 6,
    30 => 6,
    40 => 5,
    50 => 5,
    60 => 5,
    70 => 7,
    80 => 6,
    90 => 6
  ]

  sum = 0

  # 1-20 is "special" so we sum that separately
  sum += (1..19).inject(0) { |total, i| total += letters[i] }

  # We note that for 20-99 there is a fairly straightforward pattern (prefix + 1-9)
  (20..99).each do |i|
    remainder = i % 10
    prefix = i - remainder
    letters[i] = letters[prefix] + (remainder > 0 ? letters[remainder] : 0)    # Reuse for later!
    sum += letters[i]
  end

  # Pattern: 1-9 + "hundred" [ + "and" + 1-99 ]
  (100..999).each do |i|
    remainder = i % 100
    prefix = (i - remainder) / 100
    letters[i] = letters[prefix] + 7 + (remainder > 0 ? 3 + letters[remainder] : 0)
    sum += letters[i]
  end

  # For 1000
  sum += letters[1] + 8

  return sum
end

p number_letter_count