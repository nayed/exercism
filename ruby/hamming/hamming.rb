class Hamming
  def self.compute(a, b)
    raise ArgumentError unless a.length == b.length
    number = 0
    i = 0
    while i < a.length
      number += 1 unless a[i] == b[i]
      i += 1
    end
    number
  end
end
