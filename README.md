# Wiki.txt

![v](https://badgen.net/rubygems/v/wikitxt)
![dt](https://badgen.net/rubygems/dt/wikitxt)
![license](https://badgen.net/github/license/kawakamimoeki/wikitxt)

Most lightweight markup language and personal knowledge manager or wiki platform.

![screenshot](https://github.com/kawakamimoeki/wikitxt/blob/main/docs/screenshot.png)

Wikitxt is a lightweight markup language and a tool for composing Wiki . The syntax of #Wikitxt can be converted to HTML and viewed in a browser. When converted to HTML, files can be interlinked.

Wikitxt is based on the format of lists and paragraphs. Most information can be expressed in list format, and the choice between lists and paragraphs is always changing as you write.

Text decoration is limited to mutual links using hashtags. By utilizing the decoration of mutual links, you can intentionally increase the number of pages in the wiki.

In summary, it's like this:

- Lists
  - Based on the idea that most information can be expressed in lists
- Paragraphs
  - Paragraphs always have the potential to be listed. They can easily be converted to lists.
  - Paragraphs can also serve as headings.
- Mutual Links
  - Text decoration is limited to links.
  - Words you want to emphasize should be expressed as wiki pages.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add wikitxt

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install wikitxt

## Syntax

Paragraphs:

```
Wikitxt is a lightweight markup language and a tool for composing Wiki . The syntax of Wikitxt can be converted to HTML and viewed in a browser. When converted to HTML, files can be interlinked.
```

Lists:

```
  Lists
    Based on the idea that most information can be expressed in lists
  Paragraphs
    Paragraphs always have the potential to be listed. They can easily be converted to lists.
    Paragraphs can also serve as headings.
  Mutual Links
    Text decoration is limited to links.
    Words you want to emphasize should be expressed as wiki pages.
```

Internal Links:

```
#internallink
```

Internal Images:

```
#internalimage.png
```

External Links:

```
https://example.com
```

External Images:

```
https://example.com/image.png
```

Pre Blocks:

```
---
class Foo
  def bar
    p "bar"
  end
end
---
```

## Usage

### Render HTML

```ruby
Wikitxt.to_html(text)
```

### Server

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
$ wikitxt s wiki
```

Access to http://localhost:4567 .

### Build

```
$ wikitxt build wiki
```

### Search references

Install [ripgrep (rg)](https://github.com/BurntSushi/ripgrep)

```
$ rg "#RDB" .
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kawakamimoeki/wikitxt. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/kawakamimoeki/wikitxt/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Wikitxt project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kawakamimoeki/wikitxt/blob/main/CODE_OF_CONDUCT.md).
