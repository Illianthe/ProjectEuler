# Problem #18

# Approach: We start from the bottom. Replace each value
# with itself plus the maximum of the two adjacent numbers below.
# Repeat until we reach the top.
def max_path_sum(file)
  triangle = []
  File.open(file).each_line do |line|
    triangle << line.split.map! { |i| i.to_i }
  end

  (triangle.length - 2).downto(0) do |i|
    triangle[i].map!.with_index do |j, index|
      j + [triangle[i + 1][index], triangle[i + 1][index + 1]].max
    end
  end

  return triangle[0][0]
end

p max_path_sum("triangle.txt")