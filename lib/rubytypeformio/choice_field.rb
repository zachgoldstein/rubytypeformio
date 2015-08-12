require_relative 'field'
require_relative 'choice'

module Rubytypeformio
  class ChoiceField < Field

    attr_accessor :choices

    def initialize (question, description, required, type, choices)
      super(question, description, required, type)
      @choices = choices
    end

    def to_h
      hash = super.to_h

      hash[:choices] = []
      @choices.each { |c|
        hash[:choices].push(c.to_h)
      }
      return hash
    end

  end
end

