class Integer
  # Splits a number into an array containing its digits
  def to_digits
    self.to_s.split("").map { |i| i.to_i }
  end
end