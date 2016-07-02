module Web::Controllers::Events
  class Create
    include Web::Action

    params do
      param :event do
        param :name,    presence: true
        param :actor,   presence: true
        param :version, presence: true
        param :data,    presence: true
      end
    end

    def call(params)
      test(params)
    end

    def test(params)
      if params.valid? && Event.new(params[:event]).valid?
        EventRepository.create(Event.new(params[:event]))
        self.status = 200
      else
        self.status = 422
      end
    end

  end
end
#{ name: ‘event name as string’, actor: ‘actor token as string’, version: ‘1.0’, payload: {JSON object} }
