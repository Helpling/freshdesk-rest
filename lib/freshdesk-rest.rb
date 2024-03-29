require_relative 'freshdesk-rest/client'
require_relative 'freshdesk-rest/factory'
require_relative 'freshdesk-rest/version'
require_relative 'freshdesk-rest/configuration'
require_relative 'freshdesk-rest/resource/contact'
require_relative 'freshdesk-rest/resource/company'
require_relative 'freshdesk-rest/resource/ticket'
require_relative 'freshdesk-rest/resource/solutions'
require_relative 'freshdesk-rest/resource/solutions/article'
require_relative 'freshdesk-rest/resource/solutions/category'
require_relative 'freshdesk-rest/resource/solutions/folder'

module Freshdesk
  module Rest
    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.reset
      @configuration = Configuration.new
    end

    def self.configure
      yield(configuration)
    end
  end
end
