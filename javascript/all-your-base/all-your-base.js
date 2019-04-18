const convert = (array, baseInput, baseOutput) => {
  if (!validBase(baseInput)) {
    throw new Error('Wrong input base')
  }

  if (!validBase(baseOutput)) {
    throw new Error('Wrong output base')
  }

  if (array.length < 1 || (!validInput(array, baseInput) && array.length > 0)) {
    throw new Error('Input has wrong format')
  }

  let result = []

  let num = array.reduce((acc, x) => acc * baseInput + x, 0)

  do {
    result.unshift(num % baseOutput)
    num = Math.floor(num / baseOutput)
  } while (num > 0)

  return result
}

const validInput = (input, baseInput) =>
  input.length > 0 &&
  !(input.length > 1 && input[0] === 0) &&
  input.every(d => 0 <= d && d < baseInput)

const validBase = base =>
  typeof base == 'number' && Math.floor(base) === base && base > 1

export { convert }
