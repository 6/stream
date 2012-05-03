BaseScraper = require('./base_scraper').BaseScraper

class WaoScraper extends BaseScraper
  cb_anime_list: ($) ->
    $(".postlist").each ->
      $(@).find("a").each ->
        console.log $(@).text(), "--> #{$(@).attr("href")}"

  main: ->
    @scrape 'http://www.watchanimeon.com/anime-list/', @cb_anime_list

wao = new WaoScraper
wao.main()
