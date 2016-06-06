require './data/repositories/bookmark'
require 'json'

module API
  # Bookmark defines the routes for the bookmark resource.
  class Bookmark < Cuba
    define do
      on get do
        on ':id' do |id|
          on root do
            begin
              res.write Repositories::Bookmark.find(id).to_json
            rescue Mongoid::Errors::DocumentNotFound
              res.status = 404
              res.write 'Document not found.'
            end
          end
        end
      end
      on post do
        bookmark = JSON.parse(req.body.read);
        if !bookmark['url'] then
          res.status = 404
          res.write 'Url is mandatory'
        end
        puts bookmark['url']
        #TODO add to the loged user
        res.write Repositories::Bookmark.create(url: bookmark['url'], name: bookmark['name']).to_json
      end
    end
  end
end
