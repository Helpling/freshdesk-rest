module Freshdesk
  module Rest
    class Configuration
      attr_writer :api_key, :subdomain

      def initialize
        @api_key = nil
        @subdomain = nil
      end

      def api_key
        raise 'Freshdesk API key not defined' if @api_key.nil?
        @api_key
      end

      def domain
        warn_domain_deprecated
        @subdomain
      end

      def domain=(domain)
        warn_domain_deprecated
        @subdomain = domain
      end

      def subdomain
        raise 'Freshdesk subdomain not defined' if @subdomain.nil?
        @subdomain
      end

      private

        def warn_domain_deprecated
           warn "[DEPRECATION] Freshdesk config option `domain` is deprecated. Please use `subdomain` instead."
        end

    end
  end
end
