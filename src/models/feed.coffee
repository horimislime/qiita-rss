Entry = require('./entry')

class Feed
  constructor: (urlName) ->
    @urlName = urlName
    @entries = []

  addEntry: (entry) ->
    @entries.push entry

  setEntries: (entries) ->
    @entries = entries

module.exports = Feed
