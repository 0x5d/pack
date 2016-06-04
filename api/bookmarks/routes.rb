module API
  class Bookmark < Cuba
    define do
      platform = vars[:platform]

      on get do
        on ":id" do |id|
          on root do
            res.write "This is bookmark No. #{id}"
          end
        end
      end
    end
  end
end
