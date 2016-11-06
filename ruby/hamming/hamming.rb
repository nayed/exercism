class Hamming
  def self.compute(str_1, str_2)
    raise ArgumentError unless str_1.length == str_2.length
    hamming = 0
    str_1.chars.zip(str_2.chars) { |x, y| hamming += 1 unless x == y }
    hamming
  end
end

module BookKeeping
  VERSION = 3
end
