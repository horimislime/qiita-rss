Memcached = require("../memcached-wrapper")
memClient = new Memcached()

module.exports = (req, res) ->
  res.render('rss', memClient.get())
