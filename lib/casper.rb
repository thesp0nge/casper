require "webrick"
require "webrick/httpproxy"
require "casper/version"

module Casper
  class Proxy < WEBrick::HTTPProxyServer

    def initialize(config={})
      access_log = [
        [$stderr, WEBrick::AccessLog::COMMON_LOG_FORMAT],
        [$stderr, WEBrick::AccessLog::REFERER_LOG_FORMAT],
      ]
      config[:Port] ||= 8080
      config[:AccessLog] = access_log
      config[:ProxyContentHandler] = Proc.new do |req, res| Casper::Proxy.log_requests(req, res) end

      super(config)
    end

    private 
    def self.log_requests(req, res)
      $stdout.puts "#{req.request_line.chomp}"

    end
  end
end
