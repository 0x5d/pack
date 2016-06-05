require "./data/repositories/bookmark"

module API
  class Bookmark < Cuba
    define do
      platform = vars[:platform]

      on get do
        on ":id" do |id|
          on root do
            res.write Repositories::Bookmark.find id
          end
        end
      end
    end
  end
end
