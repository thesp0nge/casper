module Casper
  class TransparentProxy < WEBrick::HTTPProxyServer
    def initialize(config={})
      @req_count = 0
      @hosts=[]
      @urls=[]
      @trace_domain = ""
      @trace_domain = config[:trace] if config[:trace] and ! config[:trace].empty?

      config[:Port] = 8080 if ! config[:Port]
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

    def get_urls
      @urls.each do |u|
        $stdout.puts "#{u}\n"
      end
    end

    private 
    def log_requests(req, res)
      if (@trace_domain == "") or ( ! req.request_line.index(@trace_domain).nil?)
        $stdout.puts "[#{Time.now}] #{req.request_line.chomp} => #{res.status}\n"
        $stdout.puts "---> #{req.body} #{req.request_method}" if req.request_method == "POST"
        if @urls.index(req.request_line.chomp).nil?
          @urls << req.request_line.chomp
        end
        if @hosts.index(req.host).nil?
          @hosts << req.host
        end
        inc_req_count
      end
    end

    def inc_req_count
      @req_count += 1
    end  
  end
end
