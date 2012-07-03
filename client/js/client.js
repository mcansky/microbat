(function() {
  var now, socket;
  socket = io.connect("http://dev-netadmin-shared.accountservergroup.com:8889");
  socket.on("greeting", function(data) {
    return console.log(data);
  });
  socket.on("pong", function(data) {
    var new_now;
    new_now = (new Date).getTime();
    return console.log("Round trip: " + (new_now - data.original_timestamp) + " ms");
  });
  now = (new Date).getTime();
  socket.emit("ping", {
    timestamp: now
  });
}).call(this);
