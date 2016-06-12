require 'mongoid'

module Adapters
  # User is a MongoDB adapter for Users.
  class User
    include Mongoid::Document

    field :name, type: String
    field :email, type: String

    validates :name, presence: true
    validates :email, presence: true, format: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  end
end
