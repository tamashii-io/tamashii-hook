# Tamashii::Hookable

Helper for create hook/callback

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tamashii-hookable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tamashii-hookable

## Usage

### Hook by block

```ruby
Tamashii::Hook.after(:config) do |config|
  config.server = 'wss://tamashii.io'
end

Tamashii::Hook.run(:config, Config.new)
```

### Hook by class

```ruby
class ServerConfig
  def initialize(config)
    @config = config
  end

  def process
    @config.server = "wss://#{ENV['SERVER_HOST']}"
  end
end

Tamashii::after(:config, ServerConfig)
```

### Hookable

```ruby
class RFIDComponent
  include Hookable

  def receive(data)
    run_before(:received, data)
    card_id = parse(data).id
    run_after(:received, card_id)
  end
end

component = RFIDComponent.new
component.after(:received) do |card_id|
  # ...
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tamashii-hookable.
