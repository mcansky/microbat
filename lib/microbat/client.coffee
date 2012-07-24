class MicrobatClient
  constructor: (@servers, opts) ->
    @opts = _.extend({
      port: 8989
    }, opts || {})

    @xhr   = new XMLHttpRequest
    @pings = {}

    format_servers

  format_servers: ->
    format_server = (server_obj) ->
      if typeof(server_obj) is "string"
        obj = { hostname: server_obj }

      _.extend({ port: @opts.port }, obj)

    format_server(server) for server in @servers

  ping: (hostname, opts) ->
    opts = _.extend({
      pings: 5
    }, opts || {})

    perform_ping = =>
      now = (new Date).getTime()

      @xhr.open("GET", "http://#{hostname}:#{port}", true)
      @xhr.onreadystatechange =>
        if @xhr.readyState is 4
          unless @pings[hostname]?
            @pings[hostname] =
              times:     []
              complete:  false
              num_pings: opts.pings

          @pings[hostname].times.push((new Date).getTime() - now)

    perform_ping

    while @pings[hostname].times.length isnt @pings[hostname].num_pings
      setTimeout((->), 50)

    @pings[hostname].complete = true

    this.median(@pints[hostname].times)

  median: (arr) ->
      arr[Math.floor(arr.length / 2)]

