require_relative '../../lib/freshdesk-rest/configuration'

RSpec.describe Freshdesk::Rest::Configuration do
  let(:key)     { double }
  let(:subdomain)     { double }
  let(:service) { described_class.new }

  describe '#api_key' do
    subject { service.api_key }

    context 'pre configured' do
      before { service.api_key = key }
      before { service.subdomain = subdomain }

      it { expect(subject).to eq(key) }
    end

    context 'an API key is not set' do
      before { service.subdomain = subdomain }

      it { expect{subject}.to(raise_error 'Freshdesk API key not defined') }
    end
  end

  describe '#domain=' do
    it 'is usable but warns of deprecation' do
      expect(service).to receive(:warn)
      service.domain = subdomain
      expect(service.subdomain).to eq(subdomain)
    end
  end

  describe '#subdomain' do
    subject { service.subdomain }

    context 'pre configured' do
      before { service.api_key = key }
      before { service.subdomain = subdomain }

      it { expect(subject).to eq(subdomain) }
    end

    context 'a subdomain is not set' do
      before { service.api_key = key }

      it { expect{subject}.to(raise_error 'Freshdesk subdomain not defined') }
    end
  end
end
