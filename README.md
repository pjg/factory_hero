# FactoryHero

This gem is a poor man's attempt at replacing the fantastic [FactoryGirl](https://github.com/thoughtbot/factory_girl) gem done by [thoughtbot](https://thoughtbot.com/).

It is more of a proof of concept (or rather an exercise in coding) instead of a fully fledged working solution.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'factory_hero'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install factory_hero
```


## Usage

Defining factories:

```ruby
FactoryHero.define_factory(User) do
  name "foobar"
end

FactoryHero.define_factory(:admin, class: User) do
  name "fobar"
  admin true
end
```


Building factory objects:

```ruby
FactoryHero.build(:user)
# => #<User:0x007fb98492834 @name="foobar">

FactoryHero.build(:admin)
# => #<User:0x007fb98492834 @name="foobar" @admin=true>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at
[https://github.com/pjg/factory_hero](https://github.com/pjg/factory_hero)
