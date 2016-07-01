require 'spec_helper'
require_relative '../../../../apps/web/controllers/events/create'

describe Web::Controllers::Events::Create do
  let(:action) { Web::Controllers::Events::Create.new }


  describe 'with valid params' do
    let(:payload) { {test:'test'}.to_json }
    let(:params)  { Hash[event: { name: "Event", actor: "Actor", version: "1.0", payload: payload }] }

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
#{ name: ‘event name as string’, actor: ‘actor token as string’, version: ‘1.0’, payload: {JSON object} }
