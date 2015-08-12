require_relative '../lib/rubytypeformio'
require 'json'

puts 'We are running'

field = Rubytypeformio::Field.new('test field', 'will it work?', true, 'short_text')
# Testing json<->ruby obj conversions
# puts "manually created new field"
# puts field.pretty
# puts "question: " + field.question
#
# puts "new field json:" + field.to_json.to_s
# json_obj = field.to_json
#
# new_field = Rubytypeformio::Field.from_json(json_obj)
# puts "unmarshalled new field"
# puts new_field.pretty
# puts "question: " + new_field.question

short_field = Rubytypeformio::ShortTextField.new('will it work?', 'test short text field', true)
long_field = Rubytypeformio::LongTextField.new('will it work?', 'test long text field', true)
statement_field = Rubytypeformio::StatementField.new('will it work?', 'test statement field', true)

good_choice = Rubytypeformio::Choice.new('good')
bad_choice = Rubytypeformio::Choice.new('bad')
choices = [good_choice, bad_choice]
mc_field = Rubytypeformio::MultipleChoiceField.new('which option would you pick?', 'test multiple choice field', true, choices)

left_choice = Rubytypeformio::Choice.new('good')
right_choice = Rubytypeformio::Choice.new('bad')
left_choice.image_id = 123
right_choice.image_id = 245
choices = [left_choice, right_choice]
pc_field = Rubytypeformio::PictureChoiceField.new('which option would you pick?', 'test picture choice field', true, choices)

top_choice = Rubytypeformio::Choice.new('top')
bottom_choice = Rubytypeformio::Choice.new('bottom')
choices = [top_choice, bottom_choice]
dropdown_field = Rubytypeformio::DropdownField.new('which option would you pick?', 'test picture choice field', true, choices)


opinion_field = Rubytypeformio::OpinionField.new('will it work?', 'test statement field', true)
rating_field = Rubytypeformio::RatingField.new('will it work?', 'test rating field', true)
number_field = Rubytypeformio::NumberField.new('will it work?', 'test number field', true)
website_field = Rubytypeformio::WebsiteField.new('will it work?', 'test website field', true)
email_field = Rubytypeformio::EmailField.new('will it work?', 'test email field', true)
legal_field = Rubytypeformio::LegalField.new('will it work?', 'test legal field', true)
yesno_field = Rubytypeformio::YesNoField.new('will it work?', 'test yes no field', true)

fields = [
  field,
  short_field,
  long_field,
  statement_field,
  mc_field,
  pc_field,
  dropdown_field,
  opinion_field,
  rating_field,
  number_field,
  website_field,
  email_field,
  legal_field,
  yesno_field
]

form = Rubytypeformio::Form.new('A simple form', 'http://311008e2.ngrok.io', 123, fields)
puts "manually created new form"
puts form.pretty

json_obj = form.to_json
new_form = Rubytypeformio::Form.from_json(json_obj)
# Test json<->ruby obj
# puts "unmarshalled new form"
# puts new_form.pretty

created_form = new_form.post
puts "created form remotely"
puts created_form.pretty

puts "Form url: " + created_form.links[1].rel

