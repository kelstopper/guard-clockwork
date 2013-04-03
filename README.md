# Guard::Clockwork

Guard::Clockwork automatically starts/stops/restarts [Clockwork](https://github.com/tomykaira/clockwork)

inspired by [Guard::Sidekiq](https://github.com/uken/guard-sidekiq)


## Installation

Add this line to your application's Gemfile:

    gem 'guard-clockwork'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guard-clockwork

Add guard definition to your Guardfile by running this command:

    guard init clockwork

## Usage

Please read [Guard usage doc](http://github.com/guard/guard#readme).

## Guardfile

guard 'clockwork', clockfile: 'config/clock.rb'  do
  watch(%r{^workers/(.+)\.rb})
end

## Options

You can customize clockwork via the following options:

* `clockfile`: YOUR_CLOCK.rb

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
