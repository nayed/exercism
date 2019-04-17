class Triangle {
  constructor(...sides) {
    this.sides = sides
  }

  validate() {
    return this.checkSides() && this.checkSidesEquality()
  }

  checkSides() {
    return this.sides.every(item => item > 0)
  }

  checkSidesEquality() {
    const [a, b, c] = this.sides
    return a + b >= c && a + c >= b && b + c >= a
  }

  kind() {
    if (!this.validate()) throw new Error('illegal')

    switch (new Set(this.sides).size) {
      case 1:
        return 'equilateral'
      case 2:
        return 'isosceles'
      default:
        return 'scalene'
    }
  }
}

export { Triangle }
