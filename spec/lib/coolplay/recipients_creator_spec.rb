require './spec/spec_helper'

RSpec.describe  Coolplay::RecipientsCreator do
  let(:mommy) { Coolplay::Recipient.new(id: '', name: 'Mommy Pig') }
  let(:daddy) { Coolplay::Recipient.new(id: '', name: 'Daddy Pig') }

  before do
    auth = Coolplay::Authentication.new('andreys', 'BC230BA3C6AD681E')
    auth.call
    @token = auth.token
  end

  describe '#call' do
    let(:instance) { Coolplay::RecipientsCreator.new(@token) }

    it 'creates recipients in the cloud' do
      instance.call([mommy, daddy])
      recipients = instance.recipients
      expect(recipients[0].id).not_to eq('')
      expect(recipients[1].id).not_to eq('')
    end
  end
end
