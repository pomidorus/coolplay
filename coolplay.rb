require 'dotenv/load'
require_relative 'lib/coolplay'

auth = Coolplay::Authentication.new(ENV['USERNAME'], ENV['KEY'])
auth.call
puts auth.token
