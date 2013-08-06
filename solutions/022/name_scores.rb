# Problem #22

require 'csv'

# Approach: Convert the list of names into values in an array. Sort the array,
# then calculate the score of each name by iterating through.
def name_scores
  names = CSV.read("names.txt")[0]
  names.sort!

  values = Hash.new
  ("A".."Z").each_with_index do |letter, index|
    values[letter] = index + 1
  end

  scores = 0
  names.each_with_index do |name, index|
    scores += name.split("").inject(0) { |total, letter| total + values[letter] } * (index + 1)
  end

  scores
end

p name_scores