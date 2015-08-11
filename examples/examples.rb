require_relative '../lib/rubytypeformio'
require 'json'

puts 'We are running'

field = Rubytypeformio::Field.new('test field', 'will it work?', true, 'short_text')
puts "manually created new field"
puts field.pretty
puts "question: " + field.question

puts "new field json:" + field.to_json.to_s
jsonObj = field.to_json
puts

newField = Rubytypeformio::Field.from_json(jsonObj)
puts "unmarshalled new field"
puts newField.pretty
puts "question: " + newField.question


field2 = Rubytypeformio::Field.new('test field', 'will it work?', true, 'long_text')

form = Rubytypeformio::Form.new('A simple form', 'http://311008e2.ngrok.io', 123, [field, field2])
puts "manually created new form"
puts form.pretty
puts "title: " + form.title

puts "new form json:" + form.to_json.to_s
jsonObj = form.to_json
puts

newForm = Rubytypeformio::Form.from_json(jsonObj)
puts "unmarshalled new form"
puts newForm.pretty


createdForm = newForm.post
puts "created form remotely"
puts createdForm.pretty

