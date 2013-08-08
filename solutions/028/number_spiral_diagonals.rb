# Problem #27

# Approach: We note that there is a pattern to how the numbers are
# generated. Starting from the middle, it takes 2 steps to get to the
# first diagonal number. We repeat this 4 times and then increase
# the step size to account for a bigger spiral.
def number_spiral_diagonals
  # Start from middle - assume 1 is already counted
  sum = 1
  size = 1
  step = 2
  current = 1

  while size < 1001
    4.times do
      current += step
      sum += current
    end
    size += 2
    step += 2
  end

  return sum
end

p number_spiral_diagonals