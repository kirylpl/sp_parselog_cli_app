# sp_parselog_cli_app

Task description.
ruby script that:

- a. Receives a log as argument (webserver.log is provided) e.g.: ./parser.rb webserver.log
- b. Returns the following:
  > list of webpages with most page views ordered from most pages views to less page views e.g.:
  > /home 90 visits /index 80 visits etc... > list of webpages with most unique page views also ordered
  > e.g.:
  > /about/2 8 unique views
  > /index 5 unique views etc...

## Approach description

Ruby CLI app (UI) to call curresponding ParseLogService (BL)

## CI label

![Ruby](https://github.com/kirylpl/sp_parselog_cli_app/workflows/Ruby/badge.svg)

## How to install

`bundle`

## How to run script

`unsetopt nomatch` for zsh
`ruby run.rb "filepath/to/webserver.log"`
f.e.
`ruby run.rb "spec/fixtures/files/webserver.log"`

## How to run the test suite

`rspec ./spec/tasks/parser_spec.rb`

## Possible Improvements (ideas)

- simple frontend
- additional validations
- i18

## Ruby version

2.6.5

## Things to cover additionally later

- System dependencies

- Configuration

- Database creation

- Database initialization

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
