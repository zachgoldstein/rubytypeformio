require_relative 'field'

module Rubytypeformio

  class LongTextField < Field

    def initialize (question, description, required)
      super(question, description, required, 'long_text')
    end

    def self.from_json(string)
      data = JSON.load(string)
      obj = self.new( data["question"],
                      data["description"],
                      data["required"])
      obj.id = data["id"]
      return obj
    end

  end
end

