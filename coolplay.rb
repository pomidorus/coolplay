require 'dotenv/load'
require_relative 'lib/coolplay'

auth = Coolplay::Authentication.new(ENV['USERNAME'], ENV['KEY'])
auth.call

mommy = Coolplay::Recipient.new(id: '', name: 'Mommy Pig')
daddy = Coolplay::Recipient.new(id: '', name: 'Daddy Pig')

recipients_creator = Coolplay::RecipientsCreator.new(auth.token)
recipients_creator.call([mommy, daddy])

payment_1 = Coolplay::Payment.new(id: '', amount: 20.3, currency: 'GBP', recipient: recipients_creator.recipients[0])
payment_2 = Coolplay::Payment.new(id: '', amount: 10.1, currency: 'GBP', recipient: recipients_creator.recipients[1])

money_sender = Coolplay::MoneySender.new(auth.token)
money_sender.call([payment_1, payment_2])

sleep(10)

payments_checker = Coolplay::PaymentsChecker.new(auth.token)
payments_checker.call(money_sender.payments)
