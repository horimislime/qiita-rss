class Entry
  constructor: (jsonEntry) ->
    @title = jsonEntry.target_content.title
    @updateTime = jsonEntry.target_content.updated_at
    @id = jsonEntry.id

module.exports = Entry
