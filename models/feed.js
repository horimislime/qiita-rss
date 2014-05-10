// Generated by CoffeeScript 1.7.1
(function() {
  var Entry, Feed;

  Entry = require('./entry');

  Feed = (function() {
    function Feed(urlName) {
      this.urlName = urlName;
      this.entries = [];
    }

    Feed.prototype.addEntry = function(entry) {
      return this.entries.push(entry);
    };

    Feed.prototype.setEntries = function(entries) {
      return this.entries = entries;
    };

    return Feed;

  })();

  module.exports = Feed;

}).call(this);
