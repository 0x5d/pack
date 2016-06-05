require 'mongoid'

require_relative './api/routes'

Mongoid.load!('./mongoid.yml')
