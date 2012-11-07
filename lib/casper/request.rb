require "casper/request/entrypoint_discovery"
class WEBrick::HTTPRequest
  include Casper::EntrypointDiscovery
end
