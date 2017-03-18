module Coolplay
  class Authentication
    include HTTParty

    attr_reader :token

    def initialize(username, key)
      @username = username
      @key = key
      @token = ''
    end

    def call
      puts "Trying to authenticate user with username: #{@username} and key: #{@key}..."

      response = self.class.post(LOGIN_URL, body: body, headers: headers)
      if response.code == 200
        @token = response['token']
        puts '...Ok'
      end
    end

    private

    def body
      {
        username: @username,
        apikey: @key
      }
    end

    def headers
      {
        content_type: 'application/json'
      }
    end
  end
end
