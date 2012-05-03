scraper = require 'scraper'
opts =
  uri: 'http://www.watchanimeon.com/anime-list/'
  headers:
    'User-Agent': 'Mozilla/5.0 (compatible; Gigabot/0.1; +http://github.com/GIGADRILL/stream)'

scraper opts, (e, $) ->
  return console.log "ERROR", e if e?
  $(".postlist").each ->
    $(@).find("a").each ->
      console.log $(@).text(), "--> #{$(@).attr("href")}"
