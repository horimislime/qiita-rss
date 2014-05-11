memcache = require("memjs")

class Memcached

  CACHE_KEY: "latest-timeline"

  constructor: ->
    @client = new memcache.Client.create()

  get: (callback) ->
    @client.get @CACHE_KEY, (error, result) ->
      callback(JSON.parse(result))

  set: (feed) ->
    @client.set @CACHE_KEY, JSON.stringify(feed), (e, r) ->
      console.log "Error: #{e}" if e

module.exports = Memcached
