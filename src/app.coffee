
###
Module dependencies.
###
express = require("express")
http = require("http")
path = require("path")
request = require("request")
cron = require("cron")

Memcached = require("./memcached-wrapper")
Feed = require("./models/feed")
Entry = require("./models/entry")

memClient = new Memcached()

# all environments
app = express()
app.set "port", process.env.PORT or 3000
app.set "views", path.join(__dirname, "views")
app.set "view engine", "ejs"
app.use express.favicon()
app.use express.logger("dev")
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()
app.use app.router

app.get "/", (req, res) ->
  memClient.get (r) ->
    res.render "rss", r

http.createServer(app).listen app.get("port"), ->
  console.log "Server started: port = " + app.get("port")

console.log "App started: config = #{process.env}"

new cron.CronJob(
  cronTime: "* */60 * * * *"
  onTick: ->
    request.get
      url: "https://qiita.com/api/following?after=0&token=#{process.env.TOKEN}"
      json: true
    , (e, r, json) ->
      console.log "error: #{r.statusCode}" if r.statusCode isnt 200

      feed = new Feed(process.env.USER_NAME || "")
      newEntries = []
      memClient.get (result) ->
        if !result
          json.forEach (elem) -> feed.addEntry(new Entry(elem))
          memClient.set(feed)
          return

        json.forEach (elem) ->
          return if result.entries[0].updated_at >= elem.target_content.updated_at

          newEntries.push(new Entry(elem))

        newEntries.concat(result)
        feed.setEntries(newEntries)
        memClient.set(feed)

  start: false
).start()
