# Life

A ruby implementation of Conway's [game of life](http://en.wikipedia.org/wiki/Conway%27s_Game_of_Life).

## Installation

    $ gem install life

## Usage

To use Life, run the `life new` command. It can be used with the following options
* `--width` or `-w` specifies how many cells wide the game will be
* `--height` or `-h` specifies how many cells high the game will be
* `--generations` or `-g` specifies how many generations the simulation will run

```
$ life new -w 3 -h 4 -g 5
```
This will create a 3x4 game that runs for 5 generations

When first creating a game, you will be prompted to enter which cells are initially alive.

## TODO
* Ability to pass initial configuration as command-line option
* Animate instead of displaying all the generations

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
