require "webrick"
require "webrick/httpproxy"
require "casper/version"

module Casper
  class Proxy < WEBrick::HTTPProxyServer
    attr_reader :req_count
    attr_reader :hosts

    def initialize(config={})
      @req_count = 0
      @hosts=[]
      config[:Port] ||= 8080
      config[:AccessLog] = []
      config[:ProxyContentHandler] = Proc.new do |req, res| 
        log_requests(req, res) 
      end

      super(config)
    end

    def info
      $stdout.puts "[#{Time.now}] INFO #{@req_count} requests to #{@hosts.count} unique hosts"
    end

    def dump
      $stdout.puts "Hosts we communicate with "
      if (@hosts.count == 0)
        $stdout.puts "None\n"

      else
        @hosts.each do |h|
          $stdout.puts " >>> #{h}\n"
        end
      end
    end

    private 
    def log_requests(req, res)
      $stdout.puts "[#{Time.now}] #{req.request_line.chomp}\n"
      if @hosts.index(req.host).nil?
        @hosts << req.host
      end
      inc_req_count
    end

    def inc_req_count
      @req_count += 1
    end
  end
end
