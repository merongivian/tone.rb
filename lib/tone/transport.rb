module Tone
  module Transport
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

      def state
        `Tone.Transport.state`
      end

      def next_subdivision(subdivision)
        `Tone.Transport.nextSubdivision(subdivision)`
      end

      def schedule_once(time, &block)
        `Tone.Transport.scheduleOnce(#{block.to_n}, time)`
      end

      def schedule_repeat(time, &block)
        `Tone.Transport.scheduleRepeat(#{block.to_n}, time)`
      end

      def ticks
        `Tone.Transport.ticks`
      end

      def bpm=(new_bpm)
        `Tone.Transport.bpm.value = new_bpm`
      end

      def bpm_ramp_to(new_bpm, seconds)
        `Tone.Transport.bpm.rampTo(new_bpm, seconds)`
      end
    end
  end
end
