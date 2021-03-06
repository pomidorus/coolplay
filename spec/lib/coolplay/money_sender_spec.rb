require './spec/spec_helper'

RSpec.describe  Coolplay::MoneySender do
  let(:mommy) { Coolplay::Recipient.new(id: '', name: 'Mommy Pig') }
  let(:daddy) { Coolplay::Recipient.new(id: '', name: 'Daddy Pig') }

  before do
    auth = Coolplay::Authentication.new('andreys', 'BC230BA3C6AD681E')
    auth.call
    @token = auth.token

    recipients_creator = Coolplay::RecipientsCreator.new(@token)
    recipients_creator.call([mommy, daddy])
    @recipient_1 = recipients_creator.recipients[0]
    @recipient_2 = recipients_creator.recipients[1]
  end

  describe '#call' do
    let(:instance) { Coolplay::MoneySender.new(@token) }

    context 'with valid recipient_id' do
      let(:payment_1) { Coolplay::Payment.new(id: '', amount: 20.3, currency: 'GBP', recipient: @recipient_1) }
      let(:payment_2) { Coolplay::Payment.new(id: '', amount: 10.1, currency: 'GBP', recipient: @recipient_2) }

      it 'sends payments for processing' do
        instance.call([payment_1, payment_2])
        payments = instance.payments

        expect(payments[0].id).not_to eq('')
        expect(payments[0].status).to eq('processing')
        expect(payments[1].id).not_to eq('')
        expect(payments[1].status).to eq('processing')
      end
    end

    context 'with invalid recipient_id' do
      let(:recipient) { Coolplay::Recipient.new(id: 'abrakadabra', name: 'Daddy Pig') }
      let(:payment) { Coolplay::Payment.new(id: '', amount: 20.3, currency: 'GBP', recipient: recipient) }

      it 'do not creates payments' do
        instance.call([payment])

        expect(instance.status).to eq(500)
        expect(instance.payments).to eq([])
      end
    end
  end
end
