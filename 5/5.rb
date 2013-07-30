# Problem #5

# Brute force method
def smallest_multiple
  answer = 1
  completed = false
  until completed
    p answer
    completed = true
    (1..20).each do |i|
      if answer % i != 0
        answer += 1
        completed = false
        break
      end
    end
  end
  answer
end

# LCM using a table
def smallest_multiple_2
  lcm = 1
  a = [  1,  2,  3,  4,  5,
         6,  7,  8,  9, 10,
        11, 12, 13, 14, 15,
        16, 17, 18, 19, 20  ]

  factor = 2
  while sum_of_array(a) > 20
    if divisible?(a, factor)
      a.map! { |i| (i % factor == 0) ? i / factor : i }
      lcm *= factor
    else
      factor += 1
    end
  end

  lcm
end

def divisible?(array, factor)
  a = array.select { |i| i % factor == 0 }
  return !a.empty?
end

def sum_of_array(array)
  return array.inject(0) { |result, element| result + element }
end

# p smallest_multiple
p smallest_multiple_2