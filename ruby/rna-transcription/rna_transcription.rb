class Complement
  def self.of_dna(dna)
    return '' unless dna.count('CGTA').to_i == dna.length
    dna.tr('CGTA', 'GCAU')
  end
end

module BookKeeping
  VERSION = 4
end
