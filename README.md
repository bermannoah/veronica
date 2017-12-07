# Veronica

A gem to make it easier for sardonic young detectives to keep secrets. 

Under construction. May spontaneously accuse trusted community figures of murder, or simply not work.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'veronica'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install veronica

## Usage
Once you've included it in a project, you can use it like so:

```
Veronica.generate_sha2(digest_bits: 256, string: "I've got a secret, a good one.")`
=> "61cb3c4118402462e3055033176a2222d1a7b8e88db775bbdccd5b05b3cc7f0e"
```

You can also pass in an encoding_format:
```
Veronica.generate_sha2(digest_bits: 256, string: "Don't forget about me, Veronica.", encoding_format: "base64digest")
=> "wyWcnqQlnMtEdgR23nOeGoDm3Z5wetAj5FHoIqXj2d4="
```

Valid digest_bits settings for SHA2 are: `256, 384, 512`

Valid encoding_format settings for SHA2 are "hexdigest", "base64digest", and just "digest". 

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. Feel free to submit issues as well as PRs. 

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/bermannoah/veronica/issues).
Please respect the [Code of Conduct](https://github.com/bermannoah/veronica/blob/master/CODE_OF_CONDUCT.md).
