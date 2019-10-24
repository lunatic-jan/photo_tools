# PhotoTools - under development not published

[![Build Status](https://travis-ci.com/lunatic-jan/photo_tools.svg?branch=develop)](https://travis-ci.com/lunatic-jan/photo_tools)

Utilities for photos. It is uses mini_magick gem thus ImageMagick has to be installed in system.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'photo_tools'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install photo_tools

## Usage

At this stage it is possible to build gem:

    $ gem build photo_tools.gemspec

Install:

    $ gem install photo_tools-VERSION.gem

Use CLI:
    $ photo sign --image image.jpg --signature sig.png

## Development

* After checking out the repo, run `bin/setup` to install dependencies.
* You can also run `bin/console` for an interactive prompt that will allow you to experiment.
* CLI available, run `bin/photo --help` to see available commands and options.

## Tests
Run `bundle exec rspec` to run the tests.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
