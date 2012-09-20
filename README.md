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

## Pre-built configurations
### Random
You can use a random initial pattern if you don't feel like building one yourself. Options are the same as for the new method except that no seed is passed. All of the options are optional. If you don't pass in a value it will default to 30.

```
$ life random -w 10 -h 10 -g 5
```
or
```
$ life random
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
