# GuildQuality

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/guild_quality`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'guild_quality'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install guild_quality

## Usage

1. Create customer
```ruby

client = GuildQuality.client({ api_key: "AAAA..AAA" })

customer_data = [
  {
    "email1": "rober@example.com",
    "name": "Robert White",
    "phone1": "987-654-3210",
    "firstName": "Robert",
    "lastName": "White",
    "projects": [
        {
        "address": "2739 Veltri Drive",
        "city": "Anchorage",
        "externalId": "0001",
        "state": "AK",
        "zip": "99502",
        "value": "5000",
        "customFields": [],
        "users": []
        },
    ],
  },
]
client.create_customer(data)
```

2. Connect to different environment

```ruby
client = GuildQuality.client({
  endpoint: "https://sandbox-env-host.com",
  api_key: "AAAAA....AA",
})
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/guild_quality. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/guild_quality/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GuildQuality project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/guild_quality/blob/master/CODE_OF_CONDUCT.md).
