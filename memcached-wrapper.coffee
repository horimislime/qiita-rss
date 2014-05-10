memcache = require("memjs")

class Memcached

  CACHE_KEY: "latest-timeline"

  constructor: (host, port) ->
    @client = new memcache.Client.create()

  get: (callback) ->
    @client.get @CACHE_KEY, (result) ->
      callback(JSON.parse(result))

  set: (feed) ->
    @client.set @CACHE_KEY, JSON.stringify(feed), (e, r) ->
      if e
        console.log "set error: #{e}"

module.exports = Memcached
