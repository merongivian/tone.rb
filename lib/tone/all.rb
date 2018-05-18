class Tone
  module Event
    class Base
      include Native

      alias_native :start
      alias_native :dispose
      native_writer :loop
    end

    class Pattern < Base
      native_writer :interval

      def initialize(notes, type, &block)
        super `new Tone.Pattern(#{block.to_n}, #{notes.to_n}, type)`
      end
    end

    class Part < Base
      def initialize(definitions, &block)
        super `new Tone.Part(#{block.to_n}, #{definitions.to_n})`
      end
    end

    class Sequence < Base
      def initialize(segments, duration, &block)
        super `new Tone.Sequence(#{block.to_n}, #{segments.to_n}, duration)`
      end
    end

    class Loop < Base
      def initialize(interval, &block)
        super `new Tone.Loop(#{block.to_n}, interval)`
      end
    end
  end

  class Transport
    class << self
      def start(time = nil)
        if time
          `Tone.Transport.start(time)`
        else
          `Tone.Transport.start()`
        end
      end

      def stop(time = nil)
        if time
          `Tone.Transport.stop(time)`
        else
          `Tone.Transport.stop()`
        end
      end

      def cancel
        `Tone.Transport.cancel()`
      end

      def schedule_after(time, &block)
        future_time = `Tone.Transport.seconds + time`
        `Tone.Transport.scheduleOnce(#{block.to_n}, Tone.TransportTime(future_time))`
      end
    end
  end

  module Effect
    class Base
      include Native

      alias_native :dispose
      alias_native :connect
      alias_native :to_master

      def ==(other)
        self.class == other.class
      end
    end

    class Chorus < Base
      attr_reader :frequency, :delay_time, :depth

      def initialize(frequency: 1.5, delay_time: 3.5, depth: 0.7)
        @frequency = frequency
        @delay_time = delay_time
        @depth = depth
        super `new Tone.Chorus(frequency, delay_time, depth)`
      end

      def ==(other)
        super &&
          frequency == other.frequency &&
            delay_time == other.delay_time &&
              depth == other.depth
      end
    end

    class Vibrato < Base
      attr_reader :frequency, :depth

      def initialize(frequency: 5, depth: 0.1)
        @frequency = frequency
        @depth = depth
        super `new Tone.Vibrato(frequency, depth)`
      end

      def ==(other)
        super &&
          frequency == other.frequency &&
            depth == other.depth
      end
    end

    class Distortion < Base
      attr_reader :value

      def initialize(value: 0.4)
        @value = value
        super `new Tone.Distortion(value)`
      end

      def ==(other)
        super && value == other.value
      end
    end

    class Tremolo < Base
      attr_reader :frequency, :depth

      def initialize(frequency: 10, depth: 0.5)
        @frequency = frequency
        @depth = depth
        super `new Tone.Tremolo(frequency, depth)`
      end

      def ==(other)
        super &&
          frequency == other.frequency &&
            depth == other.depth
      end
    end

    class FeedbackDelay < Base
      attr_reader :delay_time, :feedback

      def initialize(delay_time: 0.25, feedback: 0.5)
        @delay_time = delay_time
        @feedback = feedback
        super `new Tone.FeedbackDelay(delay_time, feedback)`
      end

      def ==(other)
        super &&
          delay_time == other.delay_time &&
            feedback == other.feedback
      end
    end

    class Freeverb < Base
      attr_reader :room_size, :dampening

      def initialize(room_size: 0.7, dampening: 3000)
        @room_size = room_size
        @dampening = dampening
        super `new Tone.Freeverb(room_size, dampening)`
      end

      def ==(other)
        super &&
          room_size == other.room_size &&
            dampening == other.dampening
      end
    end

    class JCReverb < Base
      attr_reader :room_size

      def initialize(room_size: 0.5)
        @room_size = room_size
        super `new Tone.JCReverb(room_size)`
      end

      def ==(other)
        super && room_size == other.room_size
      end
    end

    class Phaser < Base
      attr_reader :frequency, :octaves, :base_frequency

      def initialize(frequency: 0.5, octaves: 3, base_frequency: 350)
        @frequency = frequency
        @octaves = octaves
        @base_frequency = base_frequency
        super `new Tone.Phaser(frequency, octaves, base_frequency)`
      end

      def ==(other)
        super &&
          frequency == other.frequency &&
            octaves == other.octaves &&
              base_frequency == other.base_frequency
      end
    end

    class PingPongDelay < Base
      attr_reader :delay_time, :feedback

      def initialize(delay_time: 0.25, feedback: 1)
        @delay_time = delay_time
        @feedback = feedback
        super `new Tone.PingPongDelay(delay_time, feedback)`
      end

      def ==(other)
        super &&
          delay_time == other.delay_time &&
              feedback == other.feedback
      end
    end
  end

  module Synth
    class Base
      include Native

      alias_native :connect
      alias_native :dispose
      alias_native :trigger_attack_release, :triggerAttackRelease
      alias_native :trigger_attack, :triggerAttack
      alias_native :trigger_release, :triggerRelease

      def chain(*effects)
        last_node_connected = self

        effects.each do |effect|
          last_node_connected.connect(effect.to_n)
          last_node_connected = effect
        end

        last_node_connected.connect(`Tone.Master`)
      end

      def initialize(native, volume: 1)
        @native = native
        `#@native.volume.value = volume`
      end

      def volume
        `#@native.volume.value`
      end

      def ==(other)
        volume == other.volume &&
          self.class == other.class
      end
    end

    class AM < Base
      def initialize(**opts)
        super `new Tone.AMSynth().toMaster()`, **opts
      end
    end

    class Duo < Base
      def initialize(**opts)
        super `new Tone.DuoSynth().toMaster()`, **opts
      end
    end

    class FM < Base
      def initialize(**opts)
        super `new Tone.FMSynth().toMaster()`, **opts
      end
    end

    class Membrane < Base
      def initialize(**opts)
        super `new Tone.MembraneSynth().toMaster()`, **opts
      end
    end

    # TODO
    class Metal < Base
      def initialize(**opts)
        super `new Tone.MetalSynth().toMaster()`, **opts
      end
    end

    class Mono < Base
      def initialize(**opts)
        super `new Tone.MonoSynth().toMaster()`, **opts
      end
    end

    # TODO
    class Noise < Base
      def initialize(**opts)
        super `new Tone.NoiseSynth().toMaster()`, **opts
      end
    end

    class Pluck < Base
      def initialize(**opts)
        super `new Tone.PluckSynth().toMaster()`, **opts
      end
    end

    class Poly < Base
      def initialize(**opts)
        super `new Tone.PolySynth().toMaster()`, **opts
      end
    end

    class Simple < Base
      def initialize(**opts)
        super `new Tone.Synth().toMaster()`, **opts
      end
    end
  end
end
