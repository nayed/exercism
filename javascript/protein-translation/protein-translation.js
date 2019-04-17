const sequence = {
  AUG: 'Methionine',
  UUU: 'Phenylalanine',
  UUC: 'Phenylalanine',
  UUA: 'Leucine',
  UUG: 'Leucine',
  UCU: 'Serine',
  UCC: 'Serine',
  UCA: 'Serine',
  UCG: 'Serine',
  UAU: 'Tyrosine',
  UAC: 'Tyrosine',
  UGU: 'Cysteine',
  UGC: 'Cysteine',
  UGG: 'Tryptophan',
  UAA: 'STOP',
  UAG: 'STOP',
  UGA: 'STOP'
}

const translate = rna => {
  const protein = []

  if (rna) {
    for (let i = 0; i < rna.length; i += 3) {
      const codon = rna.substring(i, i + 3)

      if (!sequence[codon]) throw new Error('Invalid codon')

      if (sequence[codon] === 'STOP') return protein

      protein.push(sequence[codon])
    }
  }

  return protein
}

export { translate }
