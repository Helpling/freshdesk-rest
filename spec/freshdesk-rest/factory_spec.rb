require_relative '../../lib/freshdesk-rest'

RSpec.describe Freshdesk::Rest::Factory do
  let(:service) { described_class }
  let(:config)  { double('Freshdesk::Rest::Configuration') }
  before do
    Freshdesk::Rest.configure do |config|
      config.api_key = 'SOME_FRESHDESK_API_KEY'
      config.subdomain = 'SOME_FRESHDESK_SUBDOMAIN'
    end
  end

  describe '.api' do
    subject { service.api }

    it { is_expected.to be_a(Freshdesk::Rest::Api) }
  end

  describe '.contact_resource' do
    subject { service.contact_resource }

    it { is_expected.to be_a(Freshdesk::Rest::Resource::Contact) }
  end

  describe '.ticket_resource' do
    subject { service.ticket_resource }

    it { is_expected.to be_a(Freshdesk::Rest::Resource::Ticket) }
  end

  describe '.solutions_article_resource' do
    subject { service.solutions_article_resource }

    it { is_expected.to be_a(Freshdesk::Rest::Resource::Solutions::Article) }
  end

  describe '.solutions_category_resource' do
    subject { service.solutions_category_resource }

    it { is_expected.to be_a(Freshdesk::Rest::Resource::Solutions::Category) }
  end

  describe '.solutions_folder_resource' do
    subject { service.solutions_folder_resource }

    it { is_expected.to be_a(Freshdesk::Rest::Resource::Solutions::Folder) }
  end
end
