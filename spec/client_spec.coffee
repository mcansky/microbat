describe "MicrobatClient", ->
  beforeEach ->
    @mbc = new MicrobatClient

  describe "#constructor", ->
    it "assigns an XMLHttpRequest to @xhr", ->
      xhr = new XMLHttpRequest
      expect(@mbc.xhr).toEqual(xhr)

    it "assigns an empty object to @pings", ->
      expect(@mbc.pings).toEqual({})

    it "sets 8989 as the default port", ->
      expect(@mbc.opts.port).toBe(8989)

    it 'accepts "port" option', ->
      mbc = new MicrobatClient([], port: 9999)
      expect(mbc.opts.port).toBe(9999)

  describe "#format_servers", ->
    describe "given an array of hostnames", ->
      servers = ["host1", "host2", "host3"]
      mbc     = new MicrobatClient(servers)

      e = (host) ->
        expect(mbc.format_servers()).toContain
          hostname: host, 
          port:     8989

      e(host) for host in servers

  describe "#ping", ->
    it 'sends an HTTP request ("ping")', ->
      #@mbc.ping("localhost")
      runs -> 
        @mbc.ping("localhost")

      waitsFor ->
        @mbc.pings.localhost.times.length == 2
      ,
      "all pings to be executed",
      5000

      runs ->
        expect(@mbc.pings.localhost).toEqual
          times:     jasmine.any(Number) for [0..5],
          complete:  true,
          median:    null
      
