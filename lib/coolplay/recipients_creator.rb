module Coolplay
  class RecipientsCreator
    include HTTParty

    def initialize(token)
      @token = token
    end

    def call(recipients)
      results = []
      puts "Trying to add #{recipients.count} recipients..."

      recipients.each do |recipient|
        result = add_recipient(recipient)
        next if result.nil?

        recipient.id = result['id']
        results << recipient
      end

      results
    end

    private

    def find_recipient(recipient)
      puts "Trying to find recipient with name: #{recipient.name}..."

      response = self.class.get(SEARCH_RECIPIENTS_URL, body: {name: recipient.name}, headers: headers)
      return if response.code != 200

      response['recipients']
    end

    def add_recipient(recipient)
      puts "Trying to add recipient with name: #{recipient.name}..."

      body = {
        recipient: {
          name: recipient.name
        }
      }

      response = self.class.post(CREATE_RECIPIENTS_URL, body: body, headers: headers)
      return if response.code != 201

      response['recipient']
    end

    def headers
      {
        content_type: 'application/json',
        authorization: "Bearer #{@token}"
      }
    end
  end
end
