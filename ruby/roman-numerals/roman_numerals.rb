class Integer
  ROMAN_NUMBERS = {
    "M"   =>  1000,
    "CM"  =>  900,
    "D"   =>  500,
    "CD"  =>  400,
    "C"   =>  100,
    "XC"  =>  90,
    "L"   =>  50,
    "XL"  =>  40,
    "X"   =>  10,
    "IX"  =>  9,
    "V"   =>  5,
    "IV"  =>  4,
    "I"   =>  1
  }
  
  def to_roman
    roman = ''
    number = self
    ROMAN_NUMBERS.each do |rom, arab|
      roman << rom * (number / arab)
      number = number % arab
    end
    roman
  end
end

module BookKeeping
  VERSION = 2
end
