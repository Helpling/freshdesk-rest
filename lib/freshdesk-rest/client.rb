require 'rest-client'
require_relative 'api'

module Freshdesk
  module Rest
    class Client
      def initialize(
        api_key: Freshdesk::Rest.configuration.api_key,
        subdomain: Freshdesk::Rest.configuration.subdomain
      )
        @api = Freshdesk::Rest::Api.new(
          rest_client: RestClient,
          api_key:,
          subdomain:
        )
      end

      def contact_resource
        Freshdesk::Rest::Resource::Contact.new(client: api)
      end

      def company_resource
        Freshdesk::Rest::Resource::Company.new(client: api)
      end

      def ticket_resource
        Freshdesk::Rest::Resource::Ticket.new(client: api)
      end

      def solutions_article_resource
        Freshdesk::Rest::Resource::Solutions::Article.new(client: api)
      end

      def solutions_category_resource
        Freshdesk::Rest::Resource::Solutions::Category.new(client: api)
      end

      def solutions_folder_resource
        Freshdesk::Rest::Resource::Solutions::Folder.new(client: api)
      end

      private

      attr_reader :api
    end
  end
end
