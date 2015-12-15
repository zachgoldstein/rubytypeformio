require 'json'
require_relative 'base'

module Rubytypeformio
  class Link < Base
    attr_accessor :href, :rel

    def initialize(rel, href)
      @rel = rel
      @href = href
    end

    def to_json
      JSON.dump(to_h)
    end

    def to_h
      {
        href: @href,
        rel: @rel
      }
    end

    def self.from_json(string)
      data = JSON.load(string)
      obj = new(data['href'],
                data['rel'])
      obj
    end
  end
end
