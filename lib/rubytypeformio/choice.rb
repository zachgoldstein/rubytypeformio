require 'json'
require_relative 'base'

module Rubytypeformio

  class Choice < Base
    attr_accessor :image_id, :label

    def initialize (label)
      @label = label
    end

    def to_json
      JSON.dump(self.to_h)
    end

    def to_h
      return {
          :image_id => @image_id,
          :label => @label
      }
    end

    def self.from_json(string)
      data = JSON.load(string)
      obj = self.new( data["label"])
      if (data["image_id"])
        obj.image_id = data["image_id"]
      end
      return obj
    end
  end
end