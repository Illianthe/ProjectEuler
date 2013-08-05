# Problem #8

def largest_product
  number = File.open("number.txt").read.chomp
  array = number.split("")
  array.map! { |e| e.to_i }

  largest = 0
  i = 0
  until number.size - i < 5
    product = array[i] * array[i + 1] * array[i + 2] * array[i + 3] * array[i + 4]
    largest = product if product > largest
    i += 1
  end

  largest
end

p largest_product