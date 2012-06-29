(function() {
  var fs, http, server;
  fs = require("fs");
  http = require("http");
  server = http.createServer(function(req, res) {
    var root;
    root = "" + __dirname + "/../../client";
    return fs.readFile("" + root + req.url, function(err, data) {
      if (err) {
        res.writeHead(500);
        res.end("Couldn't load " + req.url);
      }
      switch (req.url.match(/\.(\w+)$/)[1]) {
        case "html":
          res.writeHead(200, {
            "Content-Type": "text/html"
          });
          break;
        case "js":
          res.writeHead(200, {
            "Content-Type": "text/javascript"
          });
      }
      return res.end(data);
    });
  });
  server.listen(8888);
}).call(this);
