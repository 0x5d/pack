require_relative '../adapters/mongo/pack'
require_relative './errors/not_found'

module Repositories
  # Pack is a repository for packs.
  class Pack
    def self.create(pack)
      Adapters::Pack.create!(pack)
    rescue Mongoid::Errors::Validations => error
      raise ArgumentError, error.message
    end

    def self.find(id)
      Adapters::Pack.find id
    rescue Mongoid::Errors::DocumentNotFound
      raise Errors::NotFound, "Pack with id #{id} not found"
    end
  end
end
