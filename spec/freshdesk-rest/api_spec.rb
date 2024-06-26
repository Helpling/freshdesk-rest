require 'rest-client'
require 'webmock/rspec'
require_relative '../../lib/freshdesk-rest/api'

RSpec.describe Freshdesk::Rest::Api do
  let(:rest_client) { RestClient }
  let(:api_key)     { 'some_random_api_key' }
  let(:subdomain)      { 'some_random_subdomain' }
  let(:base_url)    { "https://#{subdomain}.freshdesk.com/api/v2" }
  let(:service)     { described_class.new(rest_client: rest_client, api_key: api_key, subdomain: subdomain) }

  describe '#get' do
    context 'resource is found but without content' do
      before { stub_request(:get, "#{base_url}/some_path").to_return(status: 200, body: '[]') }
      it { expect(service.get('/some_path')).to eq('[]') }
    end

    context 'resource is not found' do
      before { stub_request(:get, "#{base_url}/some_wrong_path").to_return(status: 404, body: nil) }
      it { expect{service.get('/some_wrong_path')}.to raise_error(RestClient::NotFound) }
    end

    context 'success response' do
      before { stub_request(:get, "#{base_url}/some_path").to_return(status: 200, body: '{ "some" : "response" }') }
      it { expect(service.get('/some_path')).to eq('{ "some" : "response" }') }
    end
  end

  describe '#post' do
    context 'success response' do
      before { stub_request(:post, "#{base_url}/some_path").to_return(status: 201, body: '{ "some" : "response" }') }
      it { expect(service.post('/some_path', double)).to eq('{ "some" : "response" }') }
    end
  end

  describe '#put' do
    context 'success response' do
      before { stub_request(:put, "#{base_url}/some_path").to_return(status: 200, body: '{ "some" : "response" }') }
      it { expect(service.put('/some_path', double)).to eq('{ "some" : "response" }') }
    end
  end

  describe '#delete' do
    context 'success response' do
      before { stub_request(:delete, "#{base_url}/some_path").to_return(status: 204, body: '') }
      it { expect(service.delete('/some_path')).to eq('{}') }
    end
  end
end
