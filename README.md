# ratio_convert

Handles ratio values (currently lengths only) in crystal

```crystal
require "ratio_convert"

x = Mi.new(1)
x.value
#=> 1

y = x.to_ft
y.value
#=> 5280

x < y
#=> false

x * y == Mi.new(1, power=2) == Ft.new(5280*5280, power=2)
#=> true
```

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     ratio_convert:
       github: zachiah/ratio_convert
   ```

2. Run `shards install`

## Usage

```crystal
require "ratio_convert"
```

TODO: Write usage instructions here

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/zachiah/ratio_convert/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Zachiah Sawyer](https://github.com/zachiah) - creator and maintainer
