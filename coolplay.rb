require 'dotenv/load'
require_relative 'lib/coolplay'

auth = Coolplay::Authentication.new(ENV['USERNAME'], ENV['KEY'])
auth.call
puts auth.token

mommy = Coolplay::Recipient.new(name: 'Mommy Pig')
daddy = Coolplay::Recipient.new(name: 'Daddy Pig')

recipients = Coolplay::RecipientsCreator.new(auth.token).call([mommy, daddy])


