# Problem 4

def largest_palindrome_product
  largest = 0
  (100..999).each do |i|
    (100..999).each do |j|
      product = i * j
      largest = product if product > largest and is_palindrome?(product)
    end
  end
  largest
end

def is_palindrome?(number)
  return number.to_s.reverse == number.to_s
end

p largest_palindrome_product