require 'rest-client'
require_relative 'api'

module Freshdesk
  module Rest
    class Factory
      def self.api
        Freshdesk::Rest::Api.new(
          rest_client: RestClient,
          api_key: Freshdesk::Rest.configuration.api_key,
          subdomain: Freshdesk::Rest.configuration.subdomain
        )
      end

      def self.contact_resource
        Freshdesk::Rest::Resource::Contact.new(client: api)
      end

      def self.ticket_resource
        Freshdesk::Rest::Resource::Ticket.new(client: api)
      end

      def self.solutions_article_resource
        Freshdesk::Rest::Resource::Solutions::Article.new(client: api)
      end

      def self.solutions_category_resource
        Freshdesk::Rest::Resource::Solutions::Category.new(client: api)
      end

      def self.solutions_folder_resource
        Freshdesk::Rest::Resource::Solutions::Folder.new(client: api)
      end

      class << self
        extend Gem::Deprecate
        deprecate :api, :none, 2024, 5
        deprecate :contact_resource, "Freshdesk::Rest::Client.new.contact_resource", 2024, 5
        deprecate :ticket_resource, "Freshdesk::Rest::Client.new.ticket_resource", 2024, 5
        deprecate :solutions_article_resource, "Freshdesk::Rest::Client.new.solutions_article_resource", 2024, 5
        deprecate :solutions_category_resource, "Freshdesk::Rest::Client.new.solutions_category_resource", 2024, 5
        deprecate :solutions_folder_resource, "Freshdesk::Rest::Client.new.solutions_folder_resource", 2024, 5
      end
    end
  end
end
