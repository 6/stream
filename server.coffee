require('solid') {port: process.env.PORT or 8081}, (app) ->
  app.get "/", -> @jade 'index'
  app.get "/main.css", -> {type: "text/css", body: @sass '../styles/main'}
