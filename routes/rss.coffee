Memcached = require("../memcached-wrapper")
memClient = new Memcached("localhost", 11211)

module.exports = (req, res) ->
  res.render('rss', memClient.get())
