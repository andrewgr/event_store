module Web::Views::Events
  class Index
    include Web::View

    def render
      JSON.generate(events.map(&:to_h))
    end
  end
end
