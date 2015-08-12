# Rubytypeformio

A ruby client library for the typeform i/o api

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubytypeformio'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubytypeformio

## Usage

See [examples/examples.rb](https://github.com/zachgoldstein/rubytypeformio/blob/master/examples/examples.rb) for full examples

2 second example:
```ruby

# First create the fields...
short_field = Rubytypeformio::ShortTextField.new('will it work?', 'test short text field', true)
long_field = Rubytypeformio::LongTextField.new('will it work?', 'test long text field', true)

# Then create your form...
form = Rubytypeformio::Form.new('A simple form', 'http://311008e2.ngrok.io', 123, [short_field, long_field]])

# Then post it to issue the request against the typeform API. This returns a new form object with the response data
created_form = form.post

# And now you can do what you will with it!
puts "Form url: " + created_form.links[1].rel

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zachgolstein/rubytypeformio. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

