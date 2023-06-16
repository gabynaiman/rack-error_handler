# Rack::ErrorHandler

[![Gem Version](https://badge.fury.io/rb/rack-error_handler.svg)](https://rubygems.org/gems/rack-error_handler)
[![CI](https://github.com/gabynaiman/rack-error_handler/actions/workflows/ci.yml/badge.svg)](https://github.com/gabynaiman/rack-error_handler/actions/workflows/ci.yml)
[![Coverage Status](https://coveralls.io/repos/gabynaiman/rack-error_handler/badge.svg?branch=master)](https://coveralls.io/r/gabynaiman/rack-error_handler?branch=master)
[![Code Climate](https://codeclimate.com/github/gabynaiman/rack-error_handler.svg)](https://codeclimate.com/github/gabynaiman/rack-error_handler)

Rack middleware to log request errors and respond with standard message

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-error_handler'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-error_handler

## Usage

```ruby
logger = Logger.new STDOUT

use Rack::ErrorHandler, logger: Logger.new(STDOUT)

use Rack::ErrorHandler, logger: logger,
                        error_message: '<html><body><h1>Server Error</h1></body></html>'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gabynaiman/rack-error_handler.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).