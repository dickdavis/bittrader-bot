# bittrader-bot

## Table of Contents
* About
* Getting started
    * Installation
    * Usage
* Contributing
    * Code of Conduct
    * Code Style
    * Documentation
    * Testing
* TODO
* Changelog

## About
A cryptocurrency trading bot that interfaces with a given cryptocurrency trading exchange
and sends notifications of trades via Telegram.

Documentation can be found [here](https://d3d1rty.github.io/bittrader-bot/).

## License
See `LICENSE` in the project root directory for license information.

## Getting Started
### Installation
Put installation instructions here.

### Usage
Put usage instructions here.

## Contributing
### Code of Conduct
All contributions are welcome, but are merged at the discretion of the core
contributor(s). Contributions to the project will be
judged on their merits without respect to a contributor's publicly or
privately held beliefs, opinions, ideology, nationality, ethnicity, or
demographic. Most communications within the project should be limited to
project planning, development, bugfixing, or other relevant topics; for
off-topic discussions, contributors are expected to use good judgement
and to avoid intentionally abusive behavior. Conflict should be resolved
at the lowest level possible with minimal disruption to the project. Core
contributor(s) reserve the right to request that a contributor alter their
behavior, however, nothing in this code of conduct should be construed in
such a manner that it infringes upon any contributor's freedom of expression.

### Code Style
To keep a consistent code style, it is recommended to use
[rubocop](https://github.com/bbatsov/rubocop). If you use `vim` and
[syntastic](https://github.com/vim-syntastic/syntastic), you
can use `rubocop` as a Ruby checker. To manually run `rubocop`, you
can run the following commands:

```
# Run rubocop for the entire project
bundle exec rubocop
# Run rubocop for a specific file
bundle exec rubocop foo/bar.rb
```

### Documentation
Comment any code contributions according to the existing conventions within the project.
Reference the examples listed below:

Example top-level comment:

```
##
# = ClassNameGoesHere
# Author::    [Author Information]
# Copyright:: Copyright [Year] [Author Information]
# License::   GNU Public License 3
#
# This is a class that is something and does something.
```

Example method comment:

```
##
# This is a method that does something
```

Documentation should be regenerated prior to merging any branches into master. The latest
[documentation](https://d3d1rty.github.io/gbud/) auto-sources off the `docs/` folder on
the master branch. For more information on RDoc, go
[here](https://rdoc.github.io/rdoc/index.html).

```
# Run custom rake task to regenerate RDoc documentation
rake rdoc
```

### Testing
Integration tests should be written for all classes and methods. The test suite
can be run manually `bundle exec rake test` or automatically using guard `bundle exec guard`.

## TODO
* Pull configuration data from JSON file.
* Build modular interface for exchanges.
* Connect to exchange.
* Pull last sold price from exchange for a given market.
* Convert value to USD, if necessary.
* Store spot price value query information in database.
* Pull last X number of spot price value queries.
* Determine slope value.
* If the slope exceeds max descent constraint loaded from configuration file,
    * Perform sell algorithm.
* Else If the slope exceeds max ascent constraint loaded from configuration file,
    * Perform buy algorithm.
* Else
    * Do nothing.
* If buy/sell algorithm performs transaction,
    * Send message notification to Telegram recipient listed in configuration file with transaction information.
* Else
    * Do nothing.

## Changelog
### [Date]
* Upgraded to version `X.X.X`.
* List other changes made.
* ...
