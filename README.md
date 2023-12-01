# Travel Forecast 

## Local Setup

### Prerequisites

The rest of the setup assumes you have the following installed in your local environment.

* Ruby 3.1.1. Recommended [RBenv](https://github.com/rbenv/rbenv) for managing your Ruby version.
* Rails 7.0.8
* Postgresql
* Bundler 2.4.12

Other versions may work. If you wish to test other versions you will have to modify the `Gemfile`, remove `Gemfile.lock` and run `bundle install`.

### Running the Test Suite

First, clone this repo and run the following commands.

```
bundle install
rails db:create
rails db:migrate
bundle exec rspec
```

You should have all passing tests. If you do not, make sure you have met the prerequisites.
