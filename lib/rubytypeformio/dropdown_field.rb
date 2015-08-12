require_relative 'choice_field'

module Rubytypeformio
  class DropdownField < ChoiceField

    def initialize (question, description, required, choices)
      return super(question, description, required, 'dropdown', choices)
    end

    def self.from_json(string)
      data = JSON.load(string)

      choices = []
      if (!data["choices"].nil?)
        data["choices"].each { |f|
          choices.push(Rubytypeformio::Choice.from_json(f.to_json))
        }
      end

      obj = self.new( data["question"],
                      data["description"],
                      data["required"],
                      choices)
      obj.id = data["id"]

      return obj
    end


  end
end
