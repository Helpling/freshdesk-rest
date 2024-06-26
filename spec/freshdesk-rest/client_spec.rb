require_relative '../../lib/freshdesk-rest'

RSpec.describe Freshdesk::Rest::Client do
  let(:api) { double('Freshdesk::Rest::Api') }
  let(:api_key) { 'SOME_FRESHDESK_API_KEY' }
  let(:subdomain) { 'SOME_FRESHDESK_SUBDOMAIN' }

  before do
    allow(Freshdesk::Rest::Api).to receive(:new).and_return(api)
  end

  context 'when init with default configuration' do
    before do
      Freshdesk::Rest.configure do |config|
        config.api_key = api_key
        config.subdomain = subdomain
      end
    end

    describe '.contact_resource' do
      it 'returns appropriate class with correct params' do
        allow(Freshdesk::Rest::Resource::Contact).to receive(:new)
        described_class.new.contact_resource
        expect(Freshdesk::Rest::Api).to have_received(:new).with(
          rest_client: RestClient,
          api_key:,
          subdomain:
        )
        expect(Freshdesk::Rest::Resource::Contact).to have_received(:new).with(
          client: api
        )
      end
    end

    describe '.company_resource' do
      it 'returns appropriate class with correct params' do
        allow(Freshdesk::Rest::Resource::Company).to receive(:new)
        described_class.new.company_resource
        expect(Freshdesk::Rest::Api).to have_received(:new).with(
          rest_client: RestClient,
          api_key:,
          subdomain:
        )
        expect(Freshdesk::Rest::Resource::Company).to have_received(:new).with(
          client: api
        )
      end
    end

    describe '.ticket_resource' do
      it 'returns appropriate class with correct params' do
        allow(Freshdesk::Rest::Resource::Ticket).to receive(:new)
        described_class.new.ticket_resource
        expect(Freshdesk::Rest::Api).to have_received(:new).with(
          rest_client: RestClient,
          api_key:,
          subdomain:
        )
        expect(Freshdesk::Rest::Resource::Ticket).to have_received(:new).with(
          client: api
        )
      end
    end

    describe '.solutions_article_resource' do
      it 'returns appropriate class with correct params' do
        allow(Freshdesk::Rest::Resource::Solutions::Article).to receive(:new)
        described_class.new.solutions_article_resource
        expect(Freshdesk::Rest::Api).to have_received(:new).with(
          rest_client: RestClient,
          api_key:,
          subdomain:
        )
        expect(Freshdesk::Rest::Resource::Solutions::Article).to have_received(:new).with(
          client: api
        )
      end
    end

    describe '.solutions_category_resource' do
      it 'returns appropriate class with correct params' do
        allow(Freshdesk::Rest::Resource::Solutions::Category).to receive(:new)
        described_class.new.solutions_category_resource
        expect(Freshdesk::Rest::Api).to have_received(:new).with(
          rest_client: RestClient,
          api_key:,
          subdomain:
        )
        expect(Freshdesk::Rest::Resource::Solutions::Category).to have_received(:new).with(
          client: api
        )
      end
    end

    describe '.solutions_folder_resource' do
      it 'returns appropriate class with correct params' do
        allow(Freshdesk::Rest::Resource::Solutions::Folder).to receive(:new)
        described_class.new.solutions_folder_resource
        expect(Freshdesk::Rest::Api).to have_received(:new).with(
          rest_client: RestClient,
          api_key:,
          subdomain:
        )
        expect(Freshdesk::Rest::Resource::Solutions::Folder).to have_received(:new).with(
          client: api
        )
      end
    end
  end

  context 'when init with specific keys' do
    describe '.contact_resource' do
      it 'returns appropriate class with correct params' do
        allow(Freshdesk::Rest::Resource::Contact).to receive(:new)
        described_class.new(api_key:, subdomain:).contact_resource
        expect(Freshdesk::Rest::Api).to have_received(:new).with(
          rest_client: RestClient,
          api_key:,
          subdomain:
        )
        expect(Freshdesk::Rest::Resource::Contact).to have_received(:new).with(
          client: api
        )
      end
    end

    describe '.company_resource' do
      it 'returns appropriate class with correct params' do
        allow(Freshdesk::Rest::Resource::Company).to receive(:new)
        described_class.new(api_key:, subdomain:).company_resource
        expect(Freshdesk::Rest::Api).to have_received(:new).with(
          rest_client: RestClient,
          api_key:,
          subdomain:
        )
        expect(Freshdesk::Rest::Resource::Company).to have_received(:new).with(
          client: api
        )
      end
    end

    describe '.ticket_resource' do
      it 'returns appropriate class with correct params' do
        allow(Freshdesk::Rest::Resource::Ticket).to receive(:new)
        described_class.new(api_key:, subdomain:).ticket_resource
        expect(Freshdesk::Rest::Api).to have_received(:new).with(
          rest_client: RestClient,
          api_key:,
          subdomain:
        )
        expect(Freshdesk::Rest::Resource::Ticket).to have_received(:new).with(
          client: api
        )
      end
    end

    describe '.solutions_article_resource' do
      it 'returns appropriate class with correct params' do
        allow(Freshdesk::Rest::Resource::Solutions::Article).to receive(:new)
        described_class.new(api_key:, subdomain:).solutions_article_resource
        expect(Freshdesk::Rest::Api).to have_received(:new).with(
          rest_client: RestClient,
          api_key:,
          subdomain:
        )
        expect(Freshdesk::Rest::Resource::Solutions::Article).to have_received(:new).with(
          client: api
        )
      end
    end

    describe '.solutions_category_resource' do
      it 'returns appropriate class with correct params' do
        allow(Freshdesk::Rest::Resource::Solutions::Category).to receive(:new)
        described_class.new(api_key:, subdomain:).solutions_category_resource
        expect(Freshdesk::Rest::Api).to have_received(:new).with(
          rest_client: RestClient,
          api_key:,
          subdomain:
        )
        expect(Freshdesk::Rest::Resource::Solutions::Category).to have_received(:new).with(
          client: api
        )
      end
    end

    describe '.solutions_folder_resource' do
      it 'returns appropriate class with correct params' do
        allow(Freshdesk::Rest::Resource::Solutions::Folder).to receive(:new)
        described_class.new(api_key:, subdomain:).solutions_folder_resource
        expect(Freshdesk::Rest::Api).to have_received(:new).with(
          rest_client: RestClient,
          api_key:,
          subdomain:
        )
        expect(Freshdesk::Rest::Resource::Solutions::Folder).to have_received(:new).with(
          client: api
        )
      end
    end
  end
end
