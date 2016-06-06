require './data/repositories/bookmark'

module API
  # Bookmark defines the routes for the bookmark resource.
  class Pack < Cuba
    define do
      on get do
        on ':id' do |id|
          on root do
            begin
              res.write Repositories::Pack.find id
            rescue Mongoid::Errors::DocumentNotFound
              res.status = 404
              res.write 'Document not found.'
            end
          end
        end
      end

      on post do
        res.write "papaya"
      end
    end
  end
end
