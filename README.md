# qiita-rss
QiitaのフィードをRSS化して配信します。

## Setup
```
$ heroku create
$ heroku addons:add memcachier:dev
$ heroku config:add TOKEN=QiitaのAPIトークン
$ heroku config:add USER_NAME=任意のユーザ名
```

## Usage
```
http://appname.heroku.com/
```
