# Rustdown ![Build status](https://travis-ci.org/jonasschneider/rustdown.svg?branch=master)

Rustdown is a proof of concept for Rust-based Ruby gems. It implements a Markdown-to-HTML converter. It is a Ruby gem that packages the Rust [`hoedown`](https://crates.io/crates/hoedown/) crate, which in turn packages [the C `hoedown` library](https://github.com/hoedown/hoedown).

The interesting code is probably in [`rustdown.rs`](https://github.com/jonasschneider/rustdown/blob/master/ext/librustdown/rustdown.rs) and [`rustdown.rb`](https://github.com/jonasschneider/rustdown/blob/master/lib/rustdown.rb).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rustdown'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rustdown

## Usage

    require 'rustdown'

    Rustdown.to_html("lol **important**")
    # => "<p>lol <strong>important</strong></p>\n"

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

After changing the Rust code, you have to recompile using `rake compile`.

## Contributing

1. Fork it ( https://github.com/jonasschneider/rustdown/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
