require 'cuba/test'
require 'json'

require './app'

setup do
  { post: { method: 'post', content_type: 'application/json' } }
end

scope do
  test 'creates a pack' do |config|
    pack = {
      name: 'Paco',
      parent_pack_id: 0
    }.to_json

    request '/packs', config[:post].merge(input: pack)

    assert defined?(last_response.body['_id'])
  end

  test 'returns 404 when pack is not found' do
    get '/packs/123'

    assert_equal 404, last_response.status
  end

  test 'returns an existing pack' do
    pack = Repositories::Pack.create(name: 'paco', user_id: '0')

    get "/packs/#{pack._id}"

    response = JSON.parse(last_response.body)
    assert_equal pack._id, BSON::ObjectId.from_string(response['_id']['$oid'])
  end

  test 'returns 400 when name is missing' do |config|
    pack = {
      parent_pack_id: 0,
      user_id: 0
    }.to_json

    request '/packs', config[:post].merge(input: pack)

    assert_equal 400, last_response.status
  end

  test 'creates a pack within a pack' do |config|
    pack = {
      name: 'Paco',
      parent_pack_id: 0
    }.to_json

    request '/packs/123', config[:post].merge(input: pack)

    assert defined?(last_response.body['_id'])
  end

  test 'returns 400 when name is missing for nested pack' do |config|
    pack = {
      parent_pack_id: 0,
      user_id: 0
    }.to_json

    request '/packs/123', config[:post].merge(input: pack)

    assert_equal 400, last_response.status
  end
end
