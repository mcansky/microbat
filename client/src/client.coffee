socket = io.connect("http://localhost:8889")

socket.on "greeting", (data) ->
  console.log(data)

socket.on "pong", (data) ->
  new_now = (new Date).getTime()

  #console.log(data)
  console.log("Round trip: #{new_now - data.original_timestamp} ms")

now = (new Date).getTime()
socket.emit "ping",
  timestamp: now

