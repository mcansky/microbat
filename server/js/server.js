(function() {
  var io, socket;
  io = require("socket.io");
  socket = io.listen(8889);
  socket.on("connection", function(socket) {
    return socket.emit("greeting", {
      msg: "hi"
    });
  });
}).call(this);
