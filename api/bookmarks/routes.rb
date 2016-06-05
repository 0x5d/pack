require './data/repositories/bookmark'

module API
  # Bookmark defines the routes for the bookmark resource.
  class Bookmark < Cuba
    define do
      on get do
        on ':id' do |id|
          on root do
            res.write Repositories::Bookmark.find id
          end
        end
      end
    end
  end
end
