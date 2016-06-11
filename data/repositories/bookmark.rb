require 'mongoid'

module Repositories
  # Bookmark is a repository for bookmarks.
  class Bookmark
    include Mongoid::Document

    field :url, type: String
    field :name, type: String
  end
end
