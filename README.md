# ICNS

[![Gem Version](https://img.shields.io/gem/v/icns.svg)](http://rubygems.org/gems/icns)
[![Build Status](https://travis-ci.com/soffes/icns.svg?branch=master)](https://travis-ci.com/soffes/icns)

Ruby library for extrating images from [Apple Icon Image format (ICNS)](https://en.wikipedia.org/wiki/Apple_Icon_Image_format) files.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'icns'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install icns


## Usage

Read an icon out of an ICNS file:

```ruby
require 'icns'

# Create a reader for an ICNS file
reader = Icns::Reader.new('/Applications/Preview.app/Contents/Resources/Preview.icns')

# Extract the image data for a given size
data = reader.image_for_size(1024)

# Write the image data out or do whatever you want with it
File.write('Preview.png', data)
```

Annoyingly, icons can be either PNGs or JPEG-2000s. The image data will start with `"\x89PNG"` if it is a PNG. You need to always have them in one format or another, I’d recommend using [minimagick](https://github.com/minimagick/minimagick) to convert it.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/soffes/icns.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).


## References

https://en.wikipedia.org/wiki/Apple_Icon_Image_format
