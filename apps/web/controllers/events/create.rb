module Web::Controllers::Events
  class Create
    include Web::Action

    def call(_)
      params = JSON.parse(request.body.read) || {}
      store_event(params)
    end

    # TODO: this method (1) inits an event object, (2) validates it, (3) persists it, (4) returns a response.
    # this is too much responsibilities for a single method. I'd suggest inlining this method into `call`.
    def store_event(params)
      # Can you raise an error if event is not valid then catch it and then return 422?
      # What if the object is not validated at all and an exception is rased if it can't be saved?
      if (event = Event.new(params['event'])).valid?
        EventRepository.create(event)
        # TODO: status should be 201 (created)
        # Question: shall we return the json representation of the event to the client here or blank response is fine?
        self.status = 200
      else
        self.status = 422
      end
    end
  end
end
