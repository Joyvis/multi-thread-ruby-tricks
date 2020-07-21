require 'rails_helper'

describe "ExternalRequests", type: :request do
  describe 'listing all results' do
    before { get '/external_requests' }
    let(:parsed_response) { JSON.parse(response.body) }

    it { expect(parsed_response).to be_a(Array) }
  end
end
