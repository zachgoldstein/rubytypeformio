require_relative 'field'

module Rubytypeformio
  class StatementField < Field
    def initialize(question, description, required)
      super(question, description, required, 'statement')
    end

    def self.from_json(string)
      data = JSON.load(string)
      obj = new(data['question'],
                data['description'],
                data['required'])
      obj.id = data['id']
      obj
    end
  end
end
