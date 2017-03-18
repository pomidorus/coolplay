module Coolplay
  class Recipient
    attr_accessor :name, :id

    def initialize(name:)
      @id = ''
      @name = name
    end
  end
end
