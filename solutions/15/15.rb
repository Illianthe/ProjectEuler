# Problem #15 - http://projecteuler.net/problem=15

# Approach: we set up a new array representing the intersections
# of the given grid. We then use dynamic programming to
# calculate the number of routes starting from the bottom-right.
def lattice_paths(grid_size)
  # Initialization
  intersections = Array.new(grid_size + 1)
  intersections.map! { |r| Array.new(grid_size + 1) }

  # Base case - at the bottom and right edges, there is only one route remaining.
  # Technically the bottom-right point has no routes remaining, but it doesn't matter here.
  (0..20).each do |i|
    intersections[i][20] = 1
    intersections[20][i] = 1
  end

  calculate_routes(0, 0, intersections)

  intersections[0][0]
end

def calculate_routes(x, y, intersections)
  return intersections[x][y] if !intersections[x][y].nil?
  intersections[x][y] = calculate_routes(x + 1, y, intersections) + calculate_routes(x, y + 1, intersections)
end

p lattice_paths(20)