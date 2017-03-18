require './spec/spec_helper'

RSpec.describe  Coolplay::RecipientsCreator do
  let(:mommy) { Coolplay::Recipient.new(name: 'Mommy Pig') }
  let(:daddy) { Coolplay::Recipient.new(name: 'Daddy Pig') }

  before do
    auth = Coolplay::Authentication.new('andreys', 'BC230BA3C6AD681E')
    auth.call
    @token = auth.token
  end

  describe '#call' do
    let(:instance) { Coolplay::RecipientsCreator.new(@token) }

    it 'creates recipients in the cloud' do
      recipients = instance.call([mommy, daddy])
      expect(recipients[0].id).not_to eq('')
      expect(recipients[1].id).not_to eq('')
    end
  end
end
