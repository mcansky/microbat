sock = new WebSocket("ws://localhost:8888")

sock.onopen = ->
  alert("Socket has been opened!");

sock.onmessage = (msg) ->
  alert(msg)
