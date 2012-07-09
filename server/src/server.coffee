http = require("http")

handler = (req, res) ->
  res.writeHead 200,
    "Content-Type": "text/plain"
    "Access-Control-Allow-Origin": "*"

  res.end()

server = http.createServer(handler)
server.listen(8899)
