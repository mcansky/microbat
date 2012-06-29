io   = require("socket.io")

socket = io.listen(8889)

socket.on "connection", (socket) ->
  socket.emit "greeting",
    msg: "hi"
