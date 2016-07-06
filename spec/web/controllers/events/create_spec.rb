require 'spec_helper'
require_relative '../../../../apps/web/controllers/events/create'

describe Web::Controllers::Events::Create do
  include Rack::Test::Methods

  let(:app) { Web::Controllers::Events::Create.new }

  describe 'with valid params' do

    let(:params) do
      {
        event: {
          "name"       => "Event",
          "actor"      => "Actor",
          "version"    => "1.0",
          "data"       => { "test" => "test" },
          "created_at" => "03/07/2016"
        }
      }.to_json
    end

    it 'is successful' do
      response = post("/events", params)
      response.status.must_equal 200
    end
  end

  describe 'with invalid params' do
    let(:params) { { event: {} }.to_json }

    it 'returns an error status' do
      response = post "/events", params
      response.status.must_equal 422
    end
  end
end
