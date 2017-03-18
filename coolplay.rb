require_relative 'lib/coolplay'

puts 'Trying to authenticate to Coolplay API...'

auth = Coolplay::Authentication.new
auth.call
