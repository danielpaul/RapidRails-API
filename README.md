# README

Minimal setup steps for getting the application running.

## Configuration

Edit `config/initializers/0_constants.rb` with your details:

* `APP_NAME` – name displayed in emails
* `HOST`/`BASE_URL` – domain the app runs on
* `DEFAULT_FROM_EMAIL` – default sender for mailers
* `COMPANY_NAME` and `COMPANY_LOCATION`
* `SENTRY_DSN_RAILS` – set to your Sentry DSN (or leave `nil` to disable)

## Environment variables

* `DATABASE_URL`, `CACHE_DATABASE_URL`, `QUEUE_DATABASE_URL`, `CABLE_DATABASE_URL` – required when deploying to services like Heroku so Rails can connect to PostgreSQL
* `SOLID_QUEUE_IN_PUMA` – set to run the Solid Queue supervisor inside the Puma process when you don't have a separate job processor
* `RAILS_MASTER_KEY` – required in production so Rails can decrypt `config/credentials.yml.enc`
* A running PostgreSQL instance is required for both development and test environments

## Development

Run `bin/dev` to start the web server with Solid Queue enabled so background jobs
are processed just like in production.

