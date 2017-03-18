module Coolplay
  class MoneySender
    include HTTParty

    attr_reader :payments

    def initialize(token)
      @token = token
      @payments = []
    end

    def call(payments)
      payments.each do |payment|
        result = send_money(payment)
        next if result.nil?

        payment.id = result['id']
        payment.status = result['status']
        @payments << payment
      end
    end

    private

    def send_money(payment)
      puts "Trying to send #{payment.amount} #{payment.currency} to recipient id: #{payment.recipient_id}..."

      body = {
        payment: {
          amount: payment.amount,
          currency: payment.currency,
          recipient_id: payment.recipient_id
        }
      }

      response = self.class.post(CREATE_PAYMENT_URL, body: body, headers: headers)
      return if response.code != 201

      puts '...Ok'
      response['payment']
    end

    def headers
      {
        content_type: 'application/json',
        authorization: "Bearer #{@token}"
      }
    end
  end
end
