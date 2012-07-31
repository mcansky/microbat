class @MicrobatClient
  constructor: (@servers = [], opts) ->
    @opts = _.extend({
      port: 8989
    }, opts || {})

    @xhr   = new XMLHttpRequest
    @pings = {}

    @format_servers()

  format_servers: ->
    format_server = (server_obj) =>
      if typeof(server_obj) is "string"
        server_obj = hostname: server_obj

      _.extend(port: @opts.port, server_obj)

    format_server(server) for server in @servers

  ping: (hostname, opts) ->
    opts = _.extend({
      pings: 5
      port:  @opts.port
    }, opts || {})

    perform_ping = =>
      unless @pings[hostname]?
        @pings[hostname] =
          times:     []
          complete:  false
          median:    null

      now = (new Date).getTime()

      @xhr = new XMLHttpRequest
      @xhr.open("GET", "http://#{hostname}:#{opts.port}", true)
      @xhr.onreadystatechange = =>
        if @xhr.readyState is 4
          @pings[hostname].times.push((new Date).getTime() - now)

      @xhr.send()

    perform_ping() for n in [0..opts.pings]

    #@waiter = setInterval =>
    #  if @pings[hostname].times.length is opts.pings  
    #    clearInterval(@waiter)

    #    @pings[hostname].complete = true
    #    @pings[hostname].median   = @median(@pings[hostname].times)
    #,
    #30
    #setTimeout((-> console.log(@pings)), 50) while @pings[hostname].times.length < opts.pings

    #@pings[hostname].complete = true
    #@pings[hostname].median   = @median(@pings[hostname].times)

  median: (arr) ->
      arr[Math.floor(arr.length / 2)]

