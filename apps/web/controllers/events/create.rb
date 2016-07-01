module Web::Controllers::Events
  class Create
    include Web::Action

    params do
      param :event do
        param :name,    presence: true
        param :actor,   presence: true
        param :version, presence: true
        param :payload, presence: true

      end
    end

    def call(params)
      if params.valid?
        self.status = 200
      else
        self.status = 422
      end
    end
  end
end

#{ name: ‘event name as string’, actor: ‘actor token as string’, version: ‘1.0’, payload: {JSON object} }
