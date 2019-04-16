const value = colors => {
  let result = ''
  colors.forEach(item => (result += bandColors.indexOf(item.toLowerCase())))

  return Number(result)
}

const bandColors = [
  'black',
  'brown',
  'red',
  'orange',
  'yellow',
  'green',
  'blue',
  'violet',
  'grey',
  'white'
]

export { value }
