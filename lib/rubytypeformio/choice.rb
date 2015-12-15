require 'json'
require_relative 'base'

module Rubytypeformio
  class Choice < Base
    attr_accessor :image_id, :label

    def initialize(label)
      @label = label
    end

    def to_json
      JSON.dump(to_h)
    end

    def to_h
      {
        image_id: @image_id,
        label: @label
      }
    end

    def self.from_json(string)
      data = JSON.load(string)
      obj = new(data['label'])
      obj.image_id = data['image_id'] if data['image_id']
      obj
    end
  end
end
