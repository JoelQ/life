# Life

A ruby implementation of Conway's [game of life](http://en.wikipedia.org/wiki/Conway%27s_Game_of_Life).

## Installation

    $ gem install life

## Usage

To use Life, run the `life new` command. It can be used with the following options
* `--width` or `-w` specifies how many cells wide the game will be
* `--height` or `-h` specifies how many cells high the game will be
* `--generations` or `-g` specifies how many generations the simulation will run
* '--seed' or '-s' is the initial pattern of the game. Pass coordinate pairs using the following pattern: `x:y x:y x:y ...`

```
$ life new -w 3 -h 4 -g 5 -s 3:2 1:1
```
This will create a 3x4 game that runs for 5 generations. The live cells in the starting pattern are `3,2` and `1,1`

## TODO
* Add some default configurations to start the fun

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
