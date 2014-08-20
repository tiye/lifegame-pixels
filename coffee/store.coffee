
wall = false
w = h = length = 1

get = (list, a, b) ->
  if a < 0 then return wall
  if a >= w then return wall
  if b < 0 then return wall
  if b >= h then return wall
  list[a + w * b]

set = (list, a, b, c) ->
  list[a + w * b] = c

cache = {}

create = (current) ->
  if current is cache.a then cache.b else cache.a

exports.init = (x, y) ->
  w = x
  h = y
  length = w * h

  cache.a = []
  cache.b = []

  list = create cache.b
  start = length
  while start > 0
    start -= 1
    list[start] = Math.random() > 0.9

  exports.onChange list

  update list

update = (list) ->
  another = create list

  i = 0
  while i < w
    j = 0
    while j < h
      alive = get list, i, j
      count = 0
      if (get list, (i-1), (j-1)) then count += 1
      if (get list, i, (j-1))     then count += 1
      if (get list, (i+1), (j-1)) then count += 1
      if (get list, (i-1), j)     then count += 1
      if (get list, (i+1), j)     then count += 1
      if (get list, (i-1), (j+1)) then count += 1
      if (get list, i, (j+1))     then count += 1
      if (get list, (i+1), (j+1)) then count += 1

      switch count
        when 2 then set another, i, j, alive
        when 3 then set another, i, j, true
        else set another, i, j, false
      j += 1
    i += 1

  exports.onChange another
  requestAnimationFrame ->
    if window.justStop then return
    update another

exports.onChange = ->
  console.log "nothing..."