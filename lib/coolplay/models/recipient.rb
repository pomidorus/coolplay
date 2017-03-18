module Coolplay
  class Recipient
    attr_accessor :name, :id

    def initialize(id:, name:)
      @id = id
      @name = name
    end
  end
end
