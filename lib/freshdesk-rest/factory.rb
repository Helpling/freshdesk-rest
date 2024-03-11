require 'rest-client'
require_relative 'api'

module Freshdesk
  module Rest
    class Factory
      def self.api(configuration_key = Configuration::DEFAULT_KEY)
        Freshdesk::Rest::Api.new(
          rest_client: RestClient,
          api_key: Freshdesk::Rest.configuration(configuration_key).api_key,
          domain: Freshdesk::Rest.configuration(configuration_key).domain
        )
      end

      def self.contact_resource(configuration_key = Configuration::DEFAULT_KEY)
        Freshdesk::Rest::Resource::Contact.new(client: api(configuration_key))
      end

      def self.ticket_resource(configuration_key = Configuration::DEFAULT_KEY)
        Freshdesk::Rest::Resource::Ticket.new(client: api(configuration_key))
      end

      def self.solutions_article_resource(configuration_key = Configuration::DEFAULT_KEY)
        Freshdesk::Rest::Resource::Solutions::Article.new(client: api(configuration_key))
      end

      def self.solutions_category_resource(configuration_key = Configuration::DEFAULT_KEY)
        Freshdesk::Rest::Resource::Solutions::Category.new(client: api(configuration_key))
      end

      def self.solutions_folder_resource(configuration_key = Configuration::DEFAULT_KEY)
        Freshdesk::Rest::Resource::Solutions::Folder.new(client: api(configuration_key))
      end
    end
  end
end
