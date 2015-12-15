require 'faraday'
require 'json'

require_relative 'base'
require_relative 'field'
require_relative 'link'

require_relative 'short_text_field'
require_relative 'long_text_field'
require_relative 'statement_field'
require_relative 'multiple_choice_field'
require_relative 'picture_choice_field'
require_relative 'dropdown_field'
require_relative 'opinion_field'
require_relative 'rating_field'
require_relative 'number_field'
require_relative 'website_field'
require_relative 'email_field'
require_relative 'legal_field'
require_relative 'yes_no_field'

module Rubytypeformio
  class Form < Base
    attr_accessor :id, :links, :title, :design_id, :webhook_submit_url, :fields

    def initialize(title, webhook, design_id, fields)
      @title = title
      @webhook_submit_url = webhook
      @design_id = design_id
      @fields = fields
    end

    def to_h
      hash = {
        id: @id,
        title: @title,
        design_id: @design_id,
        webhook_submit_url: @webhook_submit_url
      }

      hash[:fields] = []
      @fields.each do |f|
        hash[:fields].push(f.to_h)
      end
      hash[:links] = []
      unless @links.nil?
        @links.each do |l|
          hash[:links].push(l.to_h)
        end
      end

      hash
    end

    def to_json
      JSON.dump(to_h)
    end

    def self.from_json(string)
      data = JSON.load(string)
      fields = []
      data['fields'].each do |f|
        # @TODO: figure out a cleaner way to do this case statement
        case f['type']
        when 'short_text'
          fields.push(Rubytypeformio::ShortTextField.from_json(f.to_json))
        when 'long_text_field'
          fields.push(Rubytypeformio::LongTextField.from_json(f.to_json))
        when 'statement'
          fields.push(Rubytypeformio::StatementField.from_json(f.to_json))
        when 'multiple_choice'
          fields.push(Rubytypeformio::MultipleChoiceField.from_json(f.to_json))
        when 'picture_choice'
          fields.push(Rubytypeformio::PictureChoiceField.from_json(f.to_json))
        when 'dropdown'
          fields.push(Rubytypeformio::DropdownField.from_json(f.to_json))
        when 'yes_no'
          fields.push(Rubytypeformio::YesNoField.from_json(f.to_json))
        when 'number'
          fields.push(Rubytypeformio::NumberField.from_json(f.to_json))
        when 'rating'
          fields.push(Rubytypeformio::RatingField.from_json(f.to_json))
        when 'opinion_scale'
          fields.push(Rubytypeformio::OpinionField.from_json(f.to_json))
        when 'email'
          fields.push(Rubytypeformio::EmailField.from_json(f.to_json))
        when 'website'
          fields.push(Rubytypeformio::WebsiteField.from_json(f.to_json))
        when 'legal'
          fields.push(Rubytypeformio::LegalField.from_json(f.to_json))
        else
          fields.push(Rubytypeformio::Field.from_json(f.to_json))
        end
      end

      obj = new(data['title'],
                data['webhook_submit_url'],
                data['design_id'],
                fields)

      if data['links']
        links = []
        data['links'].each do |l|
          links.push(Rubytypeformio::Link.from_json(l.to_json))
        end
        obj.links = links
      end

      obj.id = data['id'] if data['id']

      obj
    end

    # @return [Form]
    def post
      if ENV['TYPEFORM_KEY'].nil?
        puts 'no typeform key set'
        return nil
      end

      puts 'creating new form with API'

      conn = Faraday.new(url: 'https://api.typeform.io') do |faraday|
        faraday.request :url_encoded
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end

      resp = conn.post do |req|
        req.url 'https://api.typeform.io/v0.3/forms'
        req.headers['x-api-token'] = ENV['TYPEFORM_KEY']
        req.body = compact(to_h).to_json.to_s

        puts 'REQUEST: ' + req.to_s
      end

      Rubytypeformio::Form.from_json(resp.body)
    end
  end
end
