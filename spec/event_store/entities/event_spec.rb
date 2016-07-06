require 'spec_helper'

describe Event do
  %i(name version actor data).each do |attr_name|
    it "can be initialize with attributes name" do
      event = Event.new(attr_name => attr_name.to_s)
      event.send(attr_name).must_equal attr_name.to_s
    end
  end  
end
