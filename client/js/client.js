(function() {
  var sock;
  sock = new WebSocket("ws://localhost:8888");
  sock.onopen = function() {
    return alert("Socket has been opened!");
  };
  sock.onmessage = function(msg) {
    return alert(msg);
  };
}).call(this);
