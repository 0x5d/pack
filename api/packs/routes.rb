require './data/repositories/pack'

module API
  # Bookmark defines the routes for the bookmark resource.
  class Pack < Cuba
    define do
      on ':id' do |id|
        on get do
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
        pack = JSON.parse(req.body.read)
        begin
          res.write Repositories::Pack.create!(pack).to_json
        rescue Mongoid::Errors::Validations => error
          res.status = 400
          res.write error.message
        end
      end
    end
  end
end
