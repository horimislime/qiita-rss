memcache = require("memcache")

class Memcached

  CACHE_KEY: "latest-timeline"

  constructor: (host, port) ->
    @client = new memcache.Client(port, host)
    @client.connect()

  get: (callback) ->
    @client.get @CACHE_KEY, (error, result) ->
      # console.log "debug: result = #{result}"
      callback(error, JSON.parse(result))

  set: (feed) ->
    @client.set @CACHE_KEY, JSON.stringify(feed), (e, r) ->
      if e
        console.log "set error: #{e}"

module.exports = Memcached
