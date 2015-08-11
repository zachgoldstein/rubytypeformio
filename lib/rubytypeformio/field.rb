require 'faraday'
require 'json'
require_relative 'base'

module Rubytypeformio

  class Field < Base
    attr_accessor :id, :description, :question, :required, :type

    def initialize (description ,question ,required ,type)
      @description = description
      @question = question
      @required = required
      @type = type
    end

    def to_json
      JSON.dump(self.to_h)
    end

    def to_h
      return {
          :description => @description,
          :question => @question,
          :required => @required,
          :type => @type,
      }
    end

    def self.from_json(string)
      data = JSON.load(string)
      obj = self.new( data["description"],
                      data["question"],
                      data["required"],
                      data["type"] )
      obj.id = data["id"]
      return obj
    end
  end
end