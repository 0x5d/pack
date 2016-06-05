require 'mongoid'

module Repositories
  # Bookmark is a repository for bookmarks.
  class Bookmark
    include Mongoid::Document

    field :email, type: String
    field :password_digest, type: String
  end
end
