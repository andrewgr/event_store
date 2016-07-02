require 'spec_helper'
require_relative '../../../../apps/web/controllers/events/create'

describe Web::Controllers::Events::Create do
  let(:action) { Web::Controllers::Events::Create.new }

  describe 'with valid params' do

    let(:params) do
      {
        event: {
          name:       "Event",
          actor:      "Actor",
          version:    "1.0",
          data:       { test: :test },
          created_at: Date.today
        }
      }
    end

    it 'is successful' do
      response = action.call(params)
      response[0].must_equal 200
    end
  end

  describe 'with invalid params' do
    let(:params) { Hash[] }

    it 'returns an error status' do
      response = action.call(params)
      response[0].must_equal 422
    end
  end
end
