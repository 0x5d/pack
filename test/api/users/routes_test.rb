require 'cuba/test'

require './app'

setup do
  { post: { method: 'post', content_type: 'application/json' } }
end

scope do
  test 'creates a user' do |config|
    user = {
      name: 'Paco',
      email: 'p@co.co'
    }.to_json

    request '/users', config[:post].merge(input: user)

    assert defined?(last_response.body['_id'])
  end

  test 'returns 400 when name is missing' do |config|
    user = { email: 'p@co.co' }.to_json

    request '/users', config[:post].merge(input: user)

    assert_equal 400, last_response.status
  end

  test 'returns 400 when email is missing' do |config|
    user = { name: 'Paco' }.to_json

    request '/users', config[:post].merge(input: user)

    assert_equal 400, last_response.status
  end

  test 'returns 404 when a user is not found' do
    get '/users/123'

    assert_equal 404, last_response.status
  end
end
