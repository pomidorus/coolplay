require './spec/spec_helper'

RSpec.describe  Coolplay::Authentication do
  describe '#call' do
    context 'with valid credentials' do
      let(:instance) { Coolplay::Authentication.new('andreys', 'BC230BA3C6AD681E') }

      it 'returns token' do
        instance.call
        expect(instance.token).not_to eq('')
      end
    end

    context 'with not valid credentials' do
      let(:instance) { Coolplay::Authentication.new('test', 'BC230BA3C6AD681E') }

      it 'returns token' do
        instance.call
        expect(instance.token).to eq('')
      end
    end
  end
end
