require('solid') {port: process.env.PORT or 8081}, (app) ->
  app.get "/", -> _layout(@, 'index')
  app.get "/main.css", -> _sass(@, 'main')

_layout = (t, template, layout = 'layout') ->
  body = t.jade template
  t.jade layout, {}, {body: body}

_sass = (t, file) ->
  {type: "text/css", body: t.sass "../styles/#{file}"}
