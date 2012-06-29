socket = io.connect("http://localhost:8889")

socket.on "greeting", (data) ->
  console.log(data)
