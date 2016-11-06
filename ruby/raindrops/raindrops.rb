class Raindrops
  def self.convert(number)
    factor = {
      3 => 'Pling',
      5 => 'Plang',
      7 => 'Plong'
    }
    result = factor.select { |key| number % key == 0 }
    result.empty? ? number.to_s : result.values.reduce(:+)
  end
end

module BookKeeping
  VERSION = 3
end
