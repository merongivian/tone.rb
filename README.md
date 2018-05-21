# Tone.rb

Ruby wrapper for [Tone.js](https://github.com/feedjira/feedjira). This is used in the live coding environment of [Negasonic](https://negasonic.herokuapp.com/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tone.rb'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install tone

## Usage

Tone.rb targets version 11 of Tone.js. This are the current implemented modules:

### Transport

Handles the global execution of elements in Tone.js

```ruby
# play after 0.1 seconds
Tone::Transport.start("+0.1")

# stop now
Tone::Transport.stop
```

### Synth

Adds basic functionality for handling it as an input node, playing notes, as well as the ability
to compare it with other synths

```ruby
# Volume is measured in decibels
synth = Tone::Synth::FM.new(volume: 2)

# Play the E2 note at 0 and release at 0.5 seconds
synth.trigger_attack_release('E2', 0.5, 0)

# Each synths are compared by the volume attribute
synth == Tone::Synth::FM.new(volume: 2) #=> true
synth == Tone::Synth::FM.new(volume: 3) #=> false
synth == Tone::Synth::AM.new(volume: 2) #=> false

# Connect all effects between each other and connect the synth as the input
synth.chain(array_of_effects)
```

### Effect

Similar to `Synth`, you can compare between effects, as well as remove
them trough `Effect#dispose` (good for performance)

```ruby
# each effect has specific attributes
vibrato = Tone::Effect::Vibrato.new(frequency: 5, depth: 0.1)
vibrato == Tone::Effect::Vibrato.new(frequency: 5, depth: 0.2) #=> false
```

for more info check the [Tone.js Docs](https://tonejs.github.io/docs/)

## TODO

* Basic tests
* Wrap remaining Tone.js modules

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/merongivian/tone.rb

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
