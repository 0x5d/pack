require 'cuba'
require 'cuba/safe'
require_relative './bookmarks/routes'

Cuba.plugin Cuba::Safe

Cuba.define do
  on get do
    on 'bookmarks' do
      run API::Bookmark
    end
  end
end
