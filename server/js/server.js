(function() {
  var fs, http, io, server, socket;
  fs = require("fs");
  http = require("http");
  io = require("socket.io");
  server = http.createServer(function(req, res) {
    return fs.readFile("" + __dirname + "/../../client/index.html", function(err, data) {
      if (err) {
        res.writeHead(500);
        res.end("Error loading index.html");
      }
      res.writeHead(200);
      return res.end(data);
    });
  });
  server.listen(8989);
  socket = io.listen(server);
  socket.on("connection", function(socket) {
    return socket.emit("greeting", {
      msg: "hi"
    });
  });
}).call(this);
