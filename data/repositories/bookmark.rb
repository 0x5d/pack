require "mongoid"

module Repositories
  class Bookmark
    include Mongoid::Document

    field :email, type: String
    field :password_digest, type: String

  end
end
