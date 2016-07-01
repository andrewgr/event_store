require 'hanami/model/coercer'
require 'sequel'
require 'sequel/extensions/pg_json'

class PGJsonb < Hanami::Model::Coercer
  def self.dump(value)
    ::Sequel.pg_jsonb value
  end

  def self.load(value)
    ::Kernel.Hash(value) unless value.nil?
  end
end
