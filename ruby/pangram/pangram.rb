class Pangram
  def self.is_pangram?(str)
    ('a'..'z').all? { |chr| str.downcase.include?(chr) }
  end
end

module BookKeeping
  VERSION = 2
end
