require 'mongoid'

module Repositories
  # Pack is a repository for packs.
  class Pack
    include Mongoid::Document

    field :email, type: String
    field :password_digest, type: String
  end
end
