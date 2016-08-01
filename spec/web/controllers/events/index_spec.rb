require 'spec_helper'
require_relative '../../../../apps/web/controllers/events/index'

describe Web::Controllers::Events::Index do
  let(:action) { Web::Controllers::Events::Index.new }
  let(:params) { Hash[] }

  before do
    EventRepository.clear

    @events = (1..3).map do |i|
      event = Event.new(name: "event#{i}", actor: "a", version: "1", data: {})
      EventRepository.create(event)
    end
  end

  describe "without params" do
    it 'is successful' do
      response = action.call(params)

      response[0].must_equal 200
      action.events.must_equal @events
    end
  end

  describe "with limit param" do
    let(:params) { { limit: 2 } }

    it 'is successful' do
      response = action.call(params)

      response[0].must_equal 200
      action.events.must_equal [@events[0], @events[1]]
    end
  end

  describe "with after param" do
    let(:params) { { after: @events[1].id } }

    it 'is successful' do
      response = action.call(params)

      response[0].must_equal 200
      action.events.must_equal [@events[2]]
    end
  end

  describe "with filtering by name" do
    let(:params) { { names: "event1, event3" } }

    it 'is successful' do
      response = action.call(params)

      response[0].must_equal 200
      action.events.must_equal [@events[0], @events[2]]
    end
  end
end
