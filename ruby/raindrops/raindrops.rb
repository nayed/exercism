class Raindrops
  def self.convert(number)
    response = ""
    arr = []
    (1..number).each do |n|
      arr << n if number % n == 0
    end
    response << "Pling" if arr.include? 3
    response << "Plang" if arr.include? 5
    response << "Plong" if arr.include? 7
    response.empty? ? number.to_s : response
  end
end

module BookKeeping
  VERSION = 3
end
