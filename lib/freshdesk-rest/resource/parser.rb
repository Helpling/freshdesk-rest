require 'json'

module Freshdesk
  module Rest
    module Resource
      module Parser
        OPTIONS = { max_nesting: 4, symbolize_names: true }.freeze

        def self.parse(json)
          JSON.parse(json, OPTIONS)
        end
      end
    end
  end
end
