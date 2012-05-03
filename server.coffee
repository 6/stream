require('solid') (app) ->
  app.get "/", -> @jade 'index'
