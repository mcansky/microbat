fs   = require("fs")
http = require("http")

server = http.createServer (req, res) ->
  root = "#{__dirname}/../../client"

  fs.readFile "#{root}#{req.url}", (err, data) ->
    if err
      res.writeHead(500)
      res.end("Couldn't load #{req.url}")

    switch req.url.match(/\.(\w+)$/)[1]
      when "html"
        res.writeHead 200,
          "Content-Type": "text/html"
      when "js"
        res.writeHead 200,
          "Content-Type": "text/javascript"

    res.end(data)

server.listen(8888)
