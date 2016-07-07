class EventRepository
  include Hanami::Repository

  def self.paginate(limit, after)
    query do
      asc(:id).where("id > #{after}").limit(limit)
    end
  end

  def self.filetr_by_name(names)
    query { where(name: names) }
  end
end
