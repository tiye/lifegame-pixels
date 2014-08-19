
w = innerWidth
h = innerHeight

canvas = document.querySelector('canvas')
canvas.width = w
canvas.height = h

context = canvas.getContext '2d'

x = 0

start = new Date

render = (n) ->
  if (n % 100) is 0 then console.log n
  image = context.getImageData 0, 0, w, h
  buffer = image.data

  all = w * h
  while all > 0
    all -= 1
    p = all * 4
    buffer[p] = n
    buffer[p+1] = n
    buffer[p+2] = n
    buffer[p+3] = 255

  image.data = buffer
  context.putImageData image, 0, 0

  if n < 255
    render (n + 1)
  else
    end = new Date
    alert (end - start)

render 0