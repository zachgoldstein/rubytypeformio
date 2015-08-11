require 'json'
require 'pry'

module Rubytypeformio

  class Base

    def pretty
      # pry
      puts JSON.pretty_generate(self.to_h)
    end

    def compact(hash)
      # hash.delete_if { |k, v| v.nil? }
      hash.delete_if { |key, value| value.to_s.strip == '' }
    end

    private

    def to_snake_case(string)
      string.gsub(/::/, '/').
            gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
            gsub(/([a-z\d])([A-Z])/,'\1_\2').
            tr("-", "_").
            downcase
    end

  end
end



