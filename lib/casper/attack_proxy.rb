require "casper/request"
require "casper/disable_ie_xss_protection"

module Casper
  class AttackProxy < WEBrick::HTTPProxyServer
    attr_reader :req_count
    attr_reader :hosts
    attr_reader :disable_ie_xss_protection

    def initialize(config={})
      @req_count = 0
      @hosts=[]
      @urls=[]
      @trace_domain = ""
      @trace_domain = config[:trace] if config[:trace] and ! config[:trace].empty?
      @disable_ie_xss_protection = true

      config[:Port] = 8080 if ! config[:Port]
      config[:AccessLog] = []
      config[:ProxyContentHandler] = Proc.new do |req, res| 
        res.disable_ie_xss_protection 
        req.discover_entrypoints
      end

      super(config)
    end

    def toggle_xss_disable
      @disable_ie_xss_protection = ! @disable_ie_xss_protection

      $stdout.puts "[#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}] Casper::AttackProxy - IE Anti XSS protection enabled\n" if ! @disable_ie_xss_protection
      $stdout.puts "[#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}] Casper::AttackProxy - IE Anti XSS protection disabled\n" if @disable_ie_xss_protection
    end
    
  end
end
