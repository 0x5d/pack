require 'cuba/test'

require './app'

scope do
  test 'bookmarks' do
    get '/bookmarks/123'

    assert_equal 404, last_response.status
  end
end
