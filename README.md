# Wiki.txt

![v](https://badgen.net/rubygems/v/wikitxt)
![dt](https://badgen.net/rubygems/dt/wikitxt)
![license](https://badgen.net/github/license/kawakamimoeki/wikitxt)

Most lightweight wiki written by plain text.

![screenshot](https://github.com/kawakamimoeki/wikitxt/blob/75fb0e078a2f2a2b6d41787220fc550cbe879cc9/docs/screenshot.png)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add wikitxt

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install wikitxt

## Usage

### Render HTML

```ruby
Wikitxt.to_html(text)
```

### Server

`wiki/index.txt`:

```
Link to #sample .
```

`wiki/sample.txt`:

```
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mauris orci, euismod in tortor eu, condimentum pharetra libero.

Cras at tortor urna. Maecenas nec iaculis nulla.

  Animals:
    Elephant
    Giraffe
    Tiger
    Penguin
    Dolphin
  Foods:
    Pizza
    Apple
    Chocolate
    Sushi
    Broccoli
```

```
$ wikitxt s
```

Access to http://localhost:8000 .

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kawakamimoeki/wikitxt. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/kawakamimoeki/wikitxt/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Wikitxt project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kawakamimoeki/wikitxt/blob/main/CODE_OF_CONDUCT.md).
