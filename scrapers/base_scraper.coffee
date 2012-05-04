scraper = require 'scraper'

class exports.BaseScraper
  constructor: (@delay_ms = 5000, @opts = {}) ->
    @opts.header ?= {}
    @opts.header['User-Agent'] ?= 'Mozilla/5.0 (compatible; Gigabot/0.1; +http://github.com/GIGADRILL/stream)'
  
  scrape: (uri, cb, args...) =>
    if @last_scrape?
      time_diff = new Date() - @last_scrape
      if time_diff < @delay_ms
        return setTimeout(@scrape, @delay_ms - time_diff + 50, uri, cb, args...)
    console.log "=> Scraping", uri
    @opts.uri = uri
    @last_scrape = new Date()
    scraper @opts, (e, $) ->
      return console.log "ERROR", e if e?
      cb($, args...)
  
  save: (data) ->
    null #TODO
