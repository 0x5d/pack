require_relative '../adapters/mongo/user'
require_relative './errors/not_found'

module Repositories
  # User is a repository for users.
  class User
    def self.create(user)
      Adapters::User.create!(user)
    rescue Mongoid::Errors::Validations => error
      raise ArgumentError, error.message
    end

    def self.find(id)
      Adapters::User.find id
    rescue Mongoid::Errors::DocumentNotFound
      raise Errors::NotFound, "User with id #{id} not found"
    end
  end
end
