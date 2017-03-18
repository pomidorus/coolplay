module Coolplay
  class Recipient
    attr_reader :name
    attr_writer :name

    def initialize(name:)
      @name = name
    end
  end
end
