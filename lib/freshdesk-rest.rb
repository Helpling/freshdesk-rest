require_relative 'freshdesk-rest/factory'
require_relative 'freshdesk-rest/version'
require_relative 'freshdesk-rest/configuration'
require_relative 'freshdesk-rest/resource/contact'
require_relative 'freshdesk-rest/resource/ticket'
require_relative 'freshdesk-rest/resource/solutions'
require_relative 'freshdesk-rest/resource/solutions/article'
require_relative 'freshdesk-rest/resource/solutions/category'
require_relative 'freshdesk-rest/resource/solutions/folder'

module Freshdesk
  module Rest
    @configurations = {}

    def self.configuration(configuration_key = Configuration::DEFAULT_KEY)
      @configurations[configuration_key] ||= Configuration.new
    end

    def self.reset(configuration_key = Configuration::DEFAULT_KEY)
      @configurations[configuration_key] = Configuration.new
    end

    def self.configure(configuration_key = Configuration::DEFAULT_KEY)
      yield(configuration(configuration_key))
    end
  end
end
