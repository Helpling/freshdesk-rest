module Freshdesk
  module Rest
    class Api
      def initialize(rest_client:, api_key:, subdomain:)
        @client = rest_client
        @api_key = api_key
        @subdomain = subdomain
      end

      def get(path)
        resource(path).get.body
      end

      def post(path, data)
        resource(path).post(data.to_json, content_type: 'application/json').body
      end

      def put(path, data)
        resource(path).put(data.to_json, content_type: 'application/json').body
      end

      def delete(path)
        resource(path).delete.body
        '{}'
      end

      private

      def resource(path)
        @client::Resource.new([base_url, path].join, @api_key, 'X')
      end

      def base_url
        @base_url ||= "https://#{@subdomain}.freshdesk.com/api/v2".freeze
      end
    end
  end
end
