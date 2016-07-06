module Web::Controllers::Events
  class Create
    include Web::Action

    def call(_)
      params = JSON.parse(request.body.read) || {}
      store_event(params)
    end

    def store_event(params)
      if (event = Event.new(params['event'])).valid?
        EventRepository.create(event)
        self.status = 200
      else
        self.status = 422
      end
    end
  end
end
