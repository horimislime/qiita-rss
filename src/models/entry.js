// Generated by CoffeeScript 1.7.1
(function() {
  var Entry;

  Entry = (function() {
    function Entry(jsonEntry) {
      this.title = jsonEntry.target_content.title;
      this.updateTime = jsonEntry.target_content.updated_at;
      this.id = jsonEntry.id;
    }

    return Entry;

  })();

  module.exports = Entry;

}).call(this);