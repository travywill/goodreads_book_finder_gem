# GoodreadsBooksGem

Welcome to the GoodreadsBooksGem!  This gem provides a basic interface to do simple searches for books on www.goodreads.com and allows you to read summaries of the books in your search results.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'goodreads_books_gem'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install goodreads_books_gem

## Usage

First, clone the repository from https://github.com/travywill/cli-data-gem-assessment-v-000 by typing this code into your Terminal or IDE:

  git clone https://github.com/travywill/cli-data-gem-assessment-v-000

Then make sure you change into the goodreads_books_gem directory following these steps of code:

  cd cli-data-gem-assessment-v-000
  cd goodreads_books_gem

Make sure all the dependencies are installed by running this code:

  bin/setup

To run the gem, type this code:

  ruby bin/goodreads

Using the gem is fairly straightforward.  Begin by typing in the key words for your search.  The gem will give you a list of the top search results from www.goodreads.com.  Type in the number of one of the books from your search results to read a summary of it.  Repeat if you would like to read a summary of a different book from your search results.  You will be given the option to do a new search if you would like to do so.  Indicate that you do not want to read a summary of a book and that you do not want to do a new search in order to exit the program.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'travywill'/goodreads_books_gem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the GoodreadsBooksGem project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'travywill'/goodreads_books_gem/blob/master/CODE_OF_CONDUCT.md).
