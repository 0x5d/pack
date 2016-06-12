require 'cuba'
require 'cuba/safe'
require_relative './bookmarks/routes'
require_relative './packs/routes'
require_relative './users/routes'

Cuba.plugin Cuba::Safe

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
