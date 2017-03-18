require 'httparty'

require_relative 'coolplay/authentication'
require_relative 'coolplay/recipients_creator'
require_relative 'coolplay/models/recipient'

module Coolplay
  PRODUCTION_URL = 'https://coolpay.herokuapp.com/api'
  LOGIN_URL = PRODUCTION_URL + '/login'
  SEARCH_RECIPIENTS_URL = PRODUCTION_URL + '/recipients'
  CREATE_RECIPIENTS_URL = PRODUCTION_URL + '/recipients'
end
