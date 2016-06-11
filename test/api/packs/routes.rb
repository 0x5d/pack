require 'cuba/test'

require './app'

setup do
  { post: { method: 'post', content_type: 'application/json' } }
end

scope do
  test 'Returns 404 when pack is not found' do
    get '/packs/123'

    assert_equal 404, last_response.status
  end

  test 'Creates a pack' do |config|
    pack = {
      name: 'Paco',
      parent_pack_id: 0
    }.to_json

    request '/packs', config[:post].merge(input: pack)

    assert defined?(last_response.body['_id'])
  end

  test 'Returns 400 when name is missing' do |config|
    pack = {
      parent_pack_id: 0,
      user_id: 0
    }.to_json

    request '/packs', config[:post].merge(input: pack)

    assert_equal 400, last_response.status
  end

  test 'Creates a pack within a pack' do |config|
    pack = {
      name: 'Paco',
      parent_pack_id: 0
    }.to_json

    request '/packs/123', config[:post].merge(input: pack)

    assert defined?(last_response.body['_id'])
  end

  test 'Returns 400 when name is missing for nested pack' do |config|
    pack = {
      parent_pack_id: 0,
      user_id: 0
    }.to_json

    request '/packs/123', config[:post].merge(input: pack)

    assert_equal 400, last_response.status
  end
end
