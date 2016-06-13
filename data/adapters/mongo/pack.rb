require 'mongoid'

module Adapters
  # Pack is a MongoDB adapter for Packs.
  class Pack
    include Mongoid::Document

    field :name, type: String
    field :user_id, type: String
    field :parent_pack_id, type: String

    validates :name, presence: true
    # TODO: handle when there are users
    # validates :user_id, presence: true
  end
end
