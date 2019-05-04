const colorCode = color => bandColors.indexOf(color)

const value = colors =>
  colors.reduce((acc, color) => acc * 10 + colorCode(color), 0)

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
