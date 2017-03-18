module Coolplay
  class PaymentsChecker
    include HTTParty

    attr_reader :payments

    def initialize(token)
      @token = token
      @payments = []
    end

    def call(payments)
      results = all_payments

      payments.each do |payment|
        puts "Trying to check payment with id #{payment.id}..."

        results.each do |result|
          if payment.id == result['id']
            puts result
            payment.status = result['status']
            puts '...Ok'
            break
          end
        end
        @payments << payment
      end
    end

    private

    def all_payments
      puts 'Trying to get all payments...'

      response = self.class.get(ALL_PAYMENTS_URL, headers: headers)
      return if response.code != 200

      puts '...Ok'
      response['payments']
    end

    def headers
      {
        content_type: 'application/json',
        authorization: "Bearer #{@token}"
      }
    end
  end
end
