fs   = require("fs")
http = require("http")
io   = require("socket.io")

server = http.createServer (req, res) ->
  fs.readFile "#{__dirname}/../../client/index.html", (err, data) ->
    if err
      res.writeHead(500)
      res.end("Error loading index.html")

    res.writeHead(200)
    res.end(data)

server.listen(8989)

socket = io.listen(server)

socket.on "connection", (socket) ->
  socket.emit "greeting",
    msg: "hi"
