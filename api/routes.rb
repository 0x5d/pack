require 'cuba'
require 'cuba/safe'
require_relative './bookmarks/routes'
require_relative './packs/routes'
require_relative './users/routes'

Cuba.plugin Cuba::Safe
Cuba.use Rack::Session::Cookie, secret: ENV['PACK_COOKIE_SECRET']

Cuba.define do
  on 'bookmarks' do
    run API::Bookmark
  end

  on 'packs' do
    run API::Pack
  end

  on 'users' do
    run API::User
  end
end
