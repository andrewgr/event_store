module Web::Controllers::Events
  class Index
    include Web::Action

    expose :events

    params do
      param :names, type: String
      param :limit, type: Integer
      param :after, type: Integer
    end

    def call(params)
      limit = params[:limit] || 10
      after = params[:after] || 0
      names = names.to_s.split(',')

      @events = EventRepository.paginate(limit, after).tap do |query|
        query.by_name(names) unless names.empty?
      end.all
    end
  end
end
