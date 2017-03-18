module Coolplay
  class Payment
    attr_reader :amount, :recipient_id, :currency
    attr_accessor :id, :status

    def initialize(amount:, currency:, recipient:)
      @id = ''
      @status = ''
      @amount = amount
      @currency = currency
      @recipient_id = recipient.id
    end
  end
end
