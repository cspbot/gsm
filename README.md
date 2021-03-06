# GSM Sources Manager for Ruby Gems

![](https://img.shields.io/badge/license-MIT-blue.svg)
[![](https://api.travis-ci.org/crispgm/gsm.svg)](https://travis-ci.org/crispgm/gsm)
[![Code Climate](https://codeclimate.com/github/crispgm/gsm/badges/gpa.svg)](https://codeclimate.com/github/crispgm/gsm)
[![Test Coverage](https://codeclimate.com/github/crispgm/gsm/badges/coverage.svg)](https://codeclimate.com/github/crispgm/gsm/coverage)
[![BADGINATOR](https://badginator.herokuapp.com/crispgm/gsm.svg)](https://github.com/defunctzombie/badginator)

GSM is a simple sources manager for RubyGems. GSM means GSM Sources Manager as a recursive acronym or simply Gem Sources Manager.

In Ruby development, we always need alternative RubyGems source in special networks. e.g. In China Mainland, you know. GSM helps get your gem sources managed.

## Installation

### Install with RubyGems

```
$ gem install gsm-sources-manager
$ gsm --version
```

### Or, you may install manually

```
$ git clone https://github.com/crispgm/gsm.git
$ bundle install
$ bundle exec exe/gsm --version
```

## Usage

```
Usage:

  gsm <subcommand> [options]

Options:
        -h, --help         Show this message
        -v, --version      Print the name and version
        -t, --trace        Show the full backtrace when an error occurs

Subcommands:
  list                  List all sources
  use                   Use source
  add                   Add source
  del                   Delete source
  reset                 Reset all sources
  mirror                Mirror source for Bundler
  help                  Show usage
```

See <https://crispgm.github.io/gsm/#guide> for details.

## API Reference

TODO: API Reference of `libgsm`.

## Sources

* [RubyGems](https://rubygems.org/)
* [RubyChina](https://gems.ruby-china.org/)
* [Taobao](https://ruby.taobao.org/)

## Contributing

* [GSM Sources Manager](https://github.com/crispgm/gsm) is licensed under [MIT License](/LICENSE).
* If there is a bug, you may [file an issue](https://github.com/crispgm/gsm/issues/new) or pull request directly.
* Pull requests for contribution is welcomed.
