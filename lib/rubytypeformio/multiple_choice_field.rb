require_relative 'choice_field'

module Rubytypeformio
  class MultipleChoiceField < ChoiceField
    def initialize(question, description, required, choices)
      super(question, description, required, 'multiple_choice', choices)
    end

    def self.from_json(string)
      data = JSON.load(string)

      choices = []
      unless data['choices'].nil?
        data['choices'].each do |f|
          choices.push(Rubytypeformio::Choice.from_json(f.to_json))
        end
      end

      obj = new(data['question'],
                data['description'],
                data['required'],
                choices)
      obj.id = data['id']

      obj
    end
  end
end
