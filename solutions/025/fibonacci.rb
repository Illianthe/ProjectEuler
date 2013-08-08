# Problem #25 - http://projecteuler.net/problem=25

def thousand_digit_fibonacci
  a = 1
  b = 1
  count = 2
  loop do
    temp = a + b
    a = b
    b = temp
    count += 1
    break if temp.to_s.length >= 1000
  end
  count
end

p thousand_digit_fibonacci