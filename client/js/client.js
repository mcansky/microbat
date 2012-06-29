(function() {
  var socket;
  socket = io.connect("http://localhost:8889");
  socket.on("greeting", function(data) {
    return console.log(data);
  });
}).call(this);
