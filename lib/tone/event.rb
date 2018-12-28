module Tone
  module Event
    class Base
      include Native

      alias_native :start
      alias_native :dispose
      alias_native :at
      native_writer :loop
      native_accessor :humanize
      native_writer :mute
      native_accessor :probability
      native_reader :state

      def loop_end=(time)
        `#@native.loopEnd = time`
      end

      def playback_rate=(rate)
        `#@native.playbackRate = rate`
      end

      def ==(other)
        self.class == other.class
      end
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
      attr_reader :segments, :duration

      def initialize(segments, duration, &block)
        @segments = segments
        @duration = duration
        super `new Tone.Sequence(#{block.to_n}, #{segments.to_n}, duration)`
      end

      def ==(other)
        super &&
          segments == other.segments &&
            duration == other.duration &&
              humanize == other.humanize &&
                probability == other.probability
      end
    end

    class Loop < Base
      def initialize(interval, &block)
        super `new Tone.Loop(#{block.to_n}, interval)`
      end
    end
  end
end
