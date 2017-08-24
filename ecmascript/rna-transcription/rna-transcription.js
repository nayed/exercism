export default class Transcriptor {
  constructor() {
    this.translation = new Map([['G', 'C'], ['C', 'G'], ['T', 'A'], ['A', 'U']])
  }

  toRna(nucleotide) {
    return nucleotide
      .split('')
      .map(n => {
        return this.check_nucleotide(n)
      })
      .join('')
  }

  check_nucleotide(n) {
    if (this.translation.has(n)) {
      return this.translation.get(n)
    }
    throw new Error('Invalid input DNA.')
  }
}
