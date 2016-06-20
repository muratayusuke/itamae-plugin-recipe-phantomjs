# Itamae::Plugin::Recipe::Phantomjs

Installs [phantomjs](http://phantomjs.org/). It's tested only in ubuntu 14.04 / CentOS 6+   Your contribution is welcome.

## Installation

Add this line to your application's Gemfile:

    gem 'itamae-plugin-recipe-phantomjs'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-phantomjs

## Usage

### install for system

```ruby
include_recipe 'phantomjs'
```

### node.yml

```yml
phantomjs:
  version: 2.0.0
  jobs: 1 # see http://phantomjs.org/build.html, used only by phantomjs::source.
```

## Contributing

1. Fork it ( https://github.com/muratayusuke/itamae-plugin-recipe-phantomjs/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
