require 'prime'

class Sieve
  def initialize(number)
    @number = number
    @sieve = []
  end

  def primes
    1.upto(@number) { |i| @sieve << i if i.prime? }
    @sieve
  end
end

module BookKeeping
  VERSION = 1
end
