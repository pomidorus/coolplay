require 'httparty'
require_relative 'coolplay/authentication'

module Coolplay
  PRODUCTION_URL = 'https://coolpay.herokuapp.com/api'
  LOGIN_URL = PRODUCTION_URL + '/login'
end
