require 'spec_helper'
require_relative '../../../apps/web/controllers/index.rb'
require 'pry'

describe Web::Controllers::Home::Index do
  let(:action) { Web::Controllers::Home::Index.new }
  let(:params) { Hash[] }

  it 'returns 200 status' do
    response = action.call(params)
    response[0].must_equal 200
    response[2].must_be_empty
  end
end
