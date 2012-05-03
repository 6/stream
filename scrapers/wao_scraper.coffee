BaseScraper = require('./base_scraper').BaseScraper

class WaoScraper extends BaseScraper
  cb_find: ($) ->
    $(".postlist").each ->
      $(@).find("a").each ->
        console.log $(@).text(), "--> #{$(@).attr("href")}"

  main: ->
    @scrape 'http://www.watchanimeon.com/anime-list/', @cb_find

wao = new WaoScraper
wao.main()
