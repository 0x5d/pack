require 'cuba'
require 'cuba/safe'
require_relative './bookmarks/routes'
require_relative './packs/routes'

Cuba.plugin Cuba::Safe

Cuba.define do
  on 'bookmarks' do
    run API::Bookmark
  end

  on 'packs' do
    run API::Pack
  end
end
