require('solid') {port: process.env.PORT or 8081}, (app) ->
  app.get "/", -> _layout(@, 'index')
  app.get "/main.css", -> _sass(@, 'main')
  app.get "/:provider/:id", (req) ->
    _layout(@, req.params.provider, {}, {id: req.params.id})

_layout = (t, template, opts = {}, locals = {}, layout = 'layout') ->
  body = t.jade template, opts, locals
  t.jade layout, {}, {body: body}

_sass = (t, file) ->
  {type: "text/css", body: t.sass "../styles/#{file}"}
