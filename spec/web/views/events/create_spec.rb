require 'spec_helper'
require_relative '../../../../apps/web/views/events/create'

describe Web::Views::Events::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/events/create.html.erb') }
  let(:view)      { Web::Views::Events::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  #it 'exposes #foo' do
    #view.foo.must_equal exposures.fetch(:foo)
  #end
end
