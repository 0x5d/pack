require 'mongoid'

module Repositories
  # Pack is a repository for packs.
  class Pack
    include Mongoid::Document

    field :name, type: String
    field :user_id, type: String
    field :parent_pack_id, type: String

    validates :name, presence: true
    validates :user_id, presence: true
  end
end
