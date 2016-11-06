class Complement
  def self.of_dna(rna)
    return '' unless rna.count('CGTA').to_i == rna.length
    rna.tr('CGTA', 'GCAU')
  end
end

module BookKeeping
  VERSION = 4
end
