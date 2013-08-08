# Problem #29 - http://projecteuler.net/problem=29

def distinct_powers
  terms = Hash.new

  (2..100).each do |a|
    (2..100).each do |b|
      terms[a ** b] = true
    end
  end

  return terms.length
end

p distinct_powers