require_relative 'field'

module Rubytypeformio

  class ShortTextField < Field

    def initialize (question, description, required)
      super(question, description, required, 'short_text')
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

