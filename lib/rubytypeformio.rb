require_relative 'rubytypeformio/version'

require_relative 'rubytypeformio/base'

require_relative 'rubytypeformio/field'
require_relative 'rubytypeformio/short_text_field'
require_relative 'rubytypeformio/long_text_field'
require_relative 'rubytypeformio/statement_field'
require_relative 'rubytypeformio/choice_field'
require_relative 'rubytypeformio/multiple_choice_field'
require_relative 'rubytypeformio/picture_choice_field'
require_relative 'rubytypeformio/dropdown_field'
require_relative 'rubytypeformio/opinion_field'
require_relative 'rubytypeformio/rating_field'
require_relative 'rubytypeformio/email_field'
require_relative 'rubytypeformio/website_field'
require_relative 'rubytypeformio/legal_field'
require_relative 'rubytypeformio/yes_no_field'

require_relative 'rubytypeformio/link'
require_relative 'rubytypeformio/choice'

require_relative 'rubytypeformio/client'
require_relative 'rubytypeformio/form'

module Rubytypeformio
  def hi
    puts 'O HAI'

    #   Make request to typeform api with faraday
  end
end
