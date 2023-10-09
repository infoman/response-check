# response-check

A basic utility to check if the remote site works and trigger maintenance mode
for a local site

## Installation

- copy executable file somewhere
- create `config.yml` alongside it with the following values:
  ```
  site_url: 'site to check'
  trigger_path: 'file path to trigger maintenance mode'
  template_path: 'maintenance mode config to be symlinked to trigger_path'

  ```

## Usage

Just make it run an some intervals via cron

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/infoman/response-check/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Denis Misiurca](https://github.com/infoman) - creator and maintainer
