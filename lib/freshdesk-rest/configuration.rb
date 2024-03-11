module Freshdesk
  module Rest
    class Configuration
      attr_writer :api_key, :domain

      DEFAULT_KEY = :main

      def initialize
        @api_key = nil
        @domain = nil
      end

      def api_key
        raise 'Freshdesk API key not defined' if @api_key.nil?
        @api_key
      end

      def domain
        raise 'Freshdesk domain not defined' if @domain.nil?
        @domain
      end
    end
  end
end
