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


### Environment Variables

To run locally you will need to set up some environment variables. This project includes [Figaro](https://github.com/laserlemon/figaro) in its Bundler environment and can be used to set up environment variables.

To setup up Figaro, run

```
bundle exec figaro install
```

Then, open the file `config/application.yml` and enter your environment variables. Apply for an API key with 
  * [Mapquest](https://developer.mapquest.com/user/login/sign-up) 
  * [Weather API](https://www.weatherapi.com/signup.aspx) 

You can copy and paste the following template into the file:
```
MAPQUEST_API_KEY: <your key here>
WEATHER_API_KEY: <your key here>
```