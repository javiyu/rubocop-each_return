# Rubocop::EachReturn

This cop checks for the use of return values when calling `each` method.

`each` method just returns the same object that was originally being called, so it makes no sense
to store it in another variable.

Most probably the author thought she was calling `map` and wanted to use the result, this
cop helps the developer identify those cases.

It can autocorrect this offense by removing the variable and the operator of a lvasgn. Autocorrect in this case means removing the assigment since it has no effect but the author could also want to change `each` for `map`, this gem can not help with that and the author should identify that potential problem.

```
# incorrect
value = object.each { |x| x*2 }

# correct
object.each { |x| operation! }
value = object.map { |x| x*2 }
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubocop-each_return', require: false
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install rubocop-each_return

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/javiyu/rubocop-each_return.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
