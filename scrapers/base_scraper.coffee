scraper = require 'scraper'

class exports.BaseScraper
  constructor: (@opts = {}) ->
    @opts.header ?= {}
    @opts.header['User-Agent'] ?= 'Mozilla/5.0 (compatible; Gigabot/0.1; +http://github.com/GIGADRILL/stream)'
  
  scrape: (uri, cb, args...) ->
    console.log "=> Scraping", uri
    @opts.uri = uri
    scraper @opts, (e, $) ->
      return console.log "ERROR", e if e?
      cb($, args...)
  
  save: (data) ->
    null #TODO
