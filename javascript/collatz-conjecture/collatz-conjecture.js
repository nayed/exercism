const steps = (number, step = 0) => {
  if (number <= 0) throw new Error('Only positive numbers are allowed')

  switch (true) {
    case number === 1:
      return step
    case number % 2 === 0:
      return steps(number / 2, step + 1)
    case number % 2 > 0:
      return steps(number * 3 + 1, step + 1)
    default:
      break
  }
}

export { steps }
