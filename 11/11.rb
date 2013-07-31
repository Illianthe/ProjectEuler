# Problem #11 - Largest product in a grid

def largest_product
  grid = Array.new
  File.open("grid.txt").each_line do |line|
    grid << line.split(" ").map { |i| i.to_i }
  end

  largest = 0

  # Traverse over each value in the 20x20 grid. Only have to check 4 of the 8 directions
  # because of repeats (i.e. after checking one direction, we can skip the opposite)
  (0..19).each do |i|
    (0..19).each do |j|
      product_n = product_ne = product_e = product_se = 0

      # N
      if i >= 3
        product_n = grid[i][j] * grid[i-1][j] * grid[i-2][j] * grid[i-3][j]
      end
      # NE
      if i >= 3 and j <= 16
        product_ne = grid[i][j] * grid[i-1][j+1] * grid[i-2][j+2] * grid[i-3][j+3]
      end
      # E
      if j <= 16
        product_e = grid[i][j] * grid[i][j+1] * grid[i][j+2] * grid[i][j+3]
      end
      # SE
      if i <= 16 and j <= 16
        product_se = grid[i][j] * grid[i+1][j+1] * grid[i+2][j+2] * grid[i+3][j+3]
      end

      largest = [largest, product_n, product_ne, product_e, product_se].max
    end
  end

  largest
end

p largest_product