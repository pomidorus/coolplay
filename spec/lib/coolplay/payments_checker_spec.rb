require './spec/spec_helper'

RSpec.describe  Coolplay::PaymentsChecker do
  let(:mommy) { Coolplay::Recipient.new(id: '', name: 'Mommy Pig') }
  let(:daddy) { Coolplay::Recipient.new(id: '', name: 'Daddy Pig') }
  let(:payment_1) { Coolplay::Payment.new(id: '', amount: 20.3, currency: 'GBP', recipient: @recipient_1) }
  let(:payment_2) { Coolplay::Payment.new(id: '', amount: 10.1, currency: 'GBP', recipient: @recipient_2) }

  before do
    auth = Coolplay::Authentication.new('andreys', 'BC230BA3C6AD681E')
    auth.call
    @token = auth.token

    recipients_creator = Coolplay::RecipientsCreator.new(@token)
    recipients_creator.call([mommy, daddy])
    @recipient_1 = recipients_creator.recipients[0]
    @recipient_2 = recipients_creator.recipients[1]

    @money_sender = Coolplay::MoneySender.new(@token)
    @money_sender.call([payment_1, payment_2])
  end

  describe '#call' do
    let(:instance) { Coolplay::PaymentsChecker.new(@token) }

    it 'updates payment status' do
      sleep(10)

      instance.call(@money_sender.payments)
      payments = instance.payments
      expect(payments[0].status).not_to eq('processing')
      expect(payments[1].status).not_to eq('processing')
      expect(payments[0].status).not_to eq('')
      expect(payments[1].status).not_to eq('')
    end
  end
end
