
w = innerWidth
h = innerHeight

w = h = length = 1

canvas = document.querySelector('canvas')
context = canvas.getContext '2d'

image = undefined

exports.init = (x, y) ->
  w = x
  h = y
  length = w * h
  canvas.width = w
  canvas.height = h

  image = context.getImageData 0, 0, w, h

exports.render = (list) ->
  buffer = image.data

  start = length
  while start > 0
    start -= 1
    alive = list[start]
    p = start * 4
    if alive
      buffer[p] = 255
      buffer[p+1] = 255
      buffer[p+2] = 255
    else
      buffer[p] = 0
      buffer[p+1] = 0
      buffer[p+2] = 0
    buffer[p+3] = 255

  image.data = buffer
  context.putImageData image, 0, 0
