require('solid') (app) ->
  app.get "/", -> @jade 'index'
  app.get "/main.css", -> {type: "text/css", body: @sass '../styles/main'}
