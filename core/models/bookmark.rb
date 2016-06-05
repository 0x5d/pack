module Models
  # Bookmark is a model for bookmarks.
  class Bookmark
    attr_accessor :name, :url

    def initialize(name, url)
      @name = name
      @url = url
    end
  end
end
