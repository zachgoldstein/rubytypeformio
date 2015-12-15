require 'json'
require_relative 'base'

module Rubytypeformio
  class Field < Base
    attr_accessor :id, :description, :question, :required, :type

    def initialize(question, description, required, type)
      @description = description
      @question = question
      @required = required
      @type = type
    end

    def to_json
      JSON.dump(to_h)
    end

    def to_h
      hash = {
        description: @description,
        question: @question,
        required: @required,
        type: @type,
        id: @id
      }
    end

    def self.from_json(string)
      data = JSON.load(string)
      obj = new(data['description'],
                data['question'],
                data['required'],
                data['type'])
      obj.id = data['id']
      obj
    end
  end
end
