require './data/repositories/bookmark'

module API
  # Bookmark defines the routes for the bookmark resource.
  class Bookmark < Cuba
    define do
      on get do
        on ':id' do |id|
          on root do
            begin
              res.write Repositories::Bookmark.find id
            rescue Mongoid::Errors::DocumentNotFound
              res.status = 404
              res.write 'Document not found.'
            end
          end
        end
      end
    end
  end
end
