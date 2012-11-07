require 'json'
# require 'uri'

module Casper
    module EntrypointDiscovery

      def discover_entrypoints

        #uri=URI.parse(self.request_line)

        hash = {:time=>Time.now, :method=>self.request_method, :host=>self.host, :port=>self.port, :query=>self.path}
        puts hash.to_json
      end

    end
end
