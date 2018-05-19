module Tone
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
end
