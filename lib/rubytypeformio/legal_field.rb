require_relative 'field'

module Rubytypeformio
  class LegalField < Field

    def initialize (question, description, required)
      return super(question, description, required, 'legal')
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

