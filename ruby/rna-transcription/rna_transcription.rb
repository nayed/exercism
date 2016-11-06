class Complement
  def self.of_dna(rna)
    response = ''
    rna.each_char do |letter|
      case letter
      when 'G'
        response <<'C'
      when 'C'
        response << 'G'
      when 'A'
        response <<'U'
      when 'T'
        response <<'A'
      else
        response = ''
        break
      end
    end
    response
  end
end

module BookKeeping
  VERSION = 4
end
