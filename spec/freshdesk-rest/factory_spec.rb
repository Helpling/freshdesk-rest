require_relative '../../lib/freshdesk-rest'

RSpec.describe Freshdesk::Rest::Factory do
  let(:service) { described_class }

  context 'when main account is configured' do
    before do
      Freshdesk::Rest.configure do |config|
        config.api_key = 'SOME_FRESHDESK_API_KEY'
        config.domain = 'SOME_FRESHDESK_DOMAIN'
      end
    end

    describe '.api' do
      subject { service.api }

      it {
        allow(RestClient::Resource).to receive(:new)
        subject.send(:resource, '/test_path')
        is_expected.to be_a(Freshdesk::Rest::Api)
        expect(RestClient::Resource).to have_received(:new).with(
          "https://SOME_FRESHDESK_DOMAIN.freshdesk.com/api/v2/test_path",
          "SOME_FRESHDESK_API_KEY",
          "X"
        )
      }
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

  context 'when second account is configured' do
    Freshdesk::Rest.configure(:second_account) do |config|
      config.api_key = 'SECOND_FRESHDESK_API_KEY'
      config.domain = 'SECOND_FRESHDESK_DOMAIN'
    end

    describe '.api' do
      subject { service.api(:second_account) }

      it {
        allow(RestClient::Resource).to receive(:new)
        subject.send(:resource, '/test_path')
        is_expected.to be_a(Freshdesk::Rest::Api)
        expect(RestClient::Resource).to have_received(:new).with(
          "https://SECOND_FRESHDESK_DOMAIN.freshdesk.com/api/v2/test_path",
          "SECOND_FRESHDESK_API_KEY",
          "X"
        )
      }
    end
  end
end
