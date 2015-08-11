require 'faraday'
require 'json'
require_relative 'base'
require_relative 'field'
require_relative 'link'

module Rubytypeformio

  class Form < Base

    attr_accessor :id, :links, :title, :design_id, :webhook_submit_url, :fields

    def initialize (title, webhook, design_id, fields)
      @title = title
      @webhook_submit_url = webhook
      @design_id = design_id
      @fields = fields
    end

    def to_h
      hash = {
          :id => @id,
          :title => @title,
          :designId => @design_id,
          :webhookSubmitUrl => @webhook_submit_url
      }

      hash[:fields] = []
      @fields.each { |f|
        hash[:fields].push(f.to_h)
      }
      hash[:links] = []
      if (!@links.nil?)
        @links.each { |l|
          hash[:links].push(l.to_h)
        }
      end

      return hash

    end

    def to_json
      JSON.dump(self.to_h)
    end

    def self.from_json(string)
      data = JSON.load(string)
      fields = []
      data["fields"].each { |f|
        fields.push(Rubytypeformio::Field.from_json(f.to_json))
      }

      obj = self.new(data["title"],
                     data["webhookSubmitUrl"],
                     data["designId"],
                     fields)

      if (data["links"])
        links = []
        data["links"].each { |l|
          links.push(Rubytypeformio::Link.from_json(l.to_json))
        }
        obj.links = links
      end

      if (data["id"])
        obj.id = data["id"]
      end

      return obj
    end

    # @return [Form]
    def post
      puts 'creating new form with API'

      conn = Faraday.new(:url => 'https://api.typeform.io') do |faraday|
        faraday.request :url_encoded
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end

      resp = conn.post do |req|
        req.url 'https://api.typeform.io/v0.3/forms'
        req.headers['x-api-token'] = ENV["TYPEFORM_KEY"]
        req.body = self.compact(self.to_h).to_json.to_s

        puts "REQUEST: " + req.to_s
      end

      return Rubytypeformio::Form.from_json(resp.body)
    end

  end

end