require 'httparty'
require_relative 'coolplay/authentication'
require_relative 'coolplay/models/recipient'

module Coolplay
  PRODUCTION_URL = 'https://coolpay.herokuapp.com/api'
  LOGIN_URL = PRODUCTION_URL + '/login'
end
