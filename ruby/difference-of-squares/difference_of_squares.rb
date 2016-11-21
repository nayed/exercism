class Squares
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def square_of_sum
    return 0 if number == 0
    (1..number).reduce(:+) ** 2
  end

  def sum_of_squares
    return 0 if number == 0
    (1..number).inject { |sum, n| sum + n ** 2 }
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

module BookKeeping
  VERSION = 3
end
