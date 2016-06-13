require './data/repositories/user'

module API
  # User defines the routes for the user resource.
  class User < Cuba
    define do
      on root do
        on post do
          user = JSON.parse(req.body.read)
          begin
            res.write Repositories::User.create(user).to_json
          rescue ArgumentError => error
            res.status = 400
            res.write error.message
          end
        end
      end

      on '/me' do
        on root do
          on get do
            begin
              res.write Repositories::User.find(id).to_json
            rescue Repositories::Errors::NotFound => error
              res.status = 404
              res.write error.message
            end
          end
        end
      end
    end
  end
end
