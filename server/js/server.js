(function() {
  var handler, http, server;
  http = require("http");
  handler = function(req, res) {
    res.writeHead(200, {
      "Content-Type": "text/plain",
      "Access-Control-Allow-Origin": "*"
    });
    return res.end();
  };
  server = http.createServer(handler);
  server.listen(8899);
}).call(this);
