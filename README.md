# My Personal Site

This site is built on Ruby on Rails, and is targeted at Heroku (although it should be able to be run in any Rails-friendly environment).

## Installing

- The app requires Ruby 2.0.0-p648
- Run `bundle install`

## Starting

- Create a `.env` file in the app root. This file needs the following config at a minimum:

    ```
    RACK_ENV=development
    RAILS_ENV=development
    RAILS_SECRET=xxxx
    ```
- Start the app with `bundle exec foreman start`

## Deploying to Heroku

- You'll need the Heroku Memcache add on. You can get 5MBs for free, which is more than enough
- You'll need to make sure that the correct environment variables are setup first. You can either add them manually using `heroku config:add VAR1=yep VAR2=nope ...`, or use the [heroku-config plugin](https://github.com/ddollar/heroku-config) to push the variables from your `.env` file. Just make sure that `RAILS_ENV` and `RACK_ENV` are set to production
- That's it! The `Procfile` is set up to do everything else for you

## What's used?

- [foreman](http://ddollar.github.com/foreman/) for management of environment variables and compatibility with Heroku
- [Webrick](http://www.ruby-doc.org/stdlib-2.0/libdoc/webrick/rdoc/WEBrick.html) in development, [Thin](http://code.macournoyer.com/thin/) in production
- [Dalli](https://github.com/mperham/dalli) for Memcache integration
- [Less](http://lesscss.org/) and its [Gem](https://github.com/metaskills/less-rails)
- [Haml](http://haml.info/) with [Maruku](https://github.com/bhollis/maruku) for embedding Markdown
