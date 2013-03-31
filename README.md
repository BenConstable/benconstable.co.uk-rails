# My Personal Site

This site is built on Ruby on Rails, and is targeted at Heroku (although it should be able to be run in any Rails-friendly environment).

## Installing

- If you're using RVM, the included `.rvmrc` file will ensure that you're using the right Ruby version, and that your Gems remain isolated. Just `cd` to the app root to setup Ruby and create a Gemset for the app
- If not, the app requires Ruby 1.9.2
- Run `bundle install`

## Starting

- Make sure you have [foreman](http://ddollar.github.com/foreman/) installed
- Create a `.env` file in the app root. This file needs the following config at a minimum:

    ```
    RACK_ENV=development
    RAILS_ENV=development
    RAILS_SECRET=xxxx
    TWITTER_CONSUMER_KEY=xxxx
    TWITTER_CONSUMER_SECRET=xxxx
    TWITTER_OAUTH_SECRET=xxxx
    TWITTER_OAUTH_TOKEN=xxxx
    ```
- Start the app with `foreman start --procfile="Procfile-development" --port=3000`

## Deploying to Heroku

- You'll need the Heroku Memcache add on. You can get 5MBs for free, which is more than enough
- You'll need to make sure that the correct environment variables are setup first. You can either add them manually using `heroku config:add VAR1=yep VAR2=nope ...`, or use the [heroku-config plugin](https://github.com/ddollar/heroku-config) to push the variables from your `.env` file. Just make sure that `RAILS_ENV` and `RACK_ENV` are set to production
- That's it! The `Procfile` is set up to do everything else for you

## What's used?

- [foreman](http://ddollar.github.com/foreman/) for management of environment variables and compatibility with Heroku
- [Webrick](http://www.ruby-doc.org/stdlib-2.0/libdoc/webrick/rdoc/WEBrick.html) in development, [Thin](http://code.macournoyer.com/thin/) in production
- [The Twitter API](https://dev.twitter.com/) and its [Gem](http://sferik.github.com/twitter/)
- [Dalli](https://github.com/mperham/dalli) for Memcache integration
- [Less](http://lesscss.org/) and its [Gem](https://github.com/metaskills/less-rails)
- [Haml](http://haml.info/)