(function() {
  var io, socket;
  io = require("socket.io");
  socket = io.listen(8889);
  socket.on("connection", function(socket) {
    socket.emit("greeting", {
      msg: "hi"
    });
    return socket.on("ping", function(data) {
      return socket.emit("pong", {
        original_timestamp: data.timestamp
      });
    });
  });
}).call(this);
