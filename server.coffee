fs = require 'fs'
require('solid') {port: process.env.PORT or 8081}, (app) ->
  app.get "/", -> _layout(@, 'index')
  app.get "/:file.css", (req) ->
    if req.params.file.match(/\.sass$/)
      body = @sass "../styles/#{req.params.file}"
    else
      body = fs.readFileSync "styles/#{req.params.file}.css"
    {type: "text/css", body: body}
  app.get "/:provider/:id", (req) ->
    _layout @, req.params.provider, {},
      id: req.params.id
      width: 500
      height: 375
      autoplay: true

_layout = (t, template, opts = {}, locals = {}, layout = 'layout') ->
  body = t.jade template, opts, locals
  t.jade layout, {}, {body: body}
