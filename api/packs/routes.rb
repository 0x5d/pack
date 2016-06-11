require './data/repositories/pack'

module API
  # Bookmark defines the routes for the bookmark resource.
  class Pack < Cuba
    define do
      on ':id' do |id|
        on root do
          on get do
            begin
              res.write Repositories::Pack.find id
            rescue Repositories::Errors::NotFound
              res.status = 404
              res.write 'Document not found.'
            end
          end

          on post do
            pack = JSON.parse(req.body.read)
            new_pack = pack.merge(parent_pack_id: id)
            begin
              res.write Repositories::Pack.create(new_pack).to_json
            rescue ArgumentError => error
              res.status = 400
              res.write error.message
            end
          end
        end
      end

      on post do
        new_pack = JSON.parse(req.body.read)
        begin
          res.write Repositories::Pack.create(new_pack).to_json
        rescue ArgumentError => error
          res.status = 400
          res.write error.message
        end
      end
    end
  end
end
