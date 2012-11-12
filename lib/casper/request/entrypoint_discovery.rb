require 'json'
# require 'uri'

module Casper
    module EntrypointDiscovery

      def discover_entrypoints

        hash = {:time=>Time.now, :method=>self.request_method, :host=>self.host, :port=>self.port, :path=>self.path, :query=>self.query}
        puts hash.to_json
      end

    end
end
