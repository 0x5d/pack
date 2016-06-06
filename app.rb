require 'mongoid'

require_relative './api/routes'

Mongoid.load!('./config/mongoid.yml')
