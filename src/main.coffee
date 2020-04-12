
store = require './store'
render = require './render'

store.onChange = (list) ->
  render.render list

w = innerWidth
h = innerHeight

render.init w, h
store.init w, h