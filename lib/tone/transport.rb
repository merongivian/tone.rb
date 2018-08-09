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

      def pause(time = '+0.1')
        `Tone.Transport.pause(time)`
      end

      def cancel
        `Tone.Transport.cancel()`
      end

      def clear(event_id)
        `Tone.Transport.clear(event_id)`
      end

      def state
        `Tone.Transport.state`
      end

      def loop_end=(time)
        `Tone.Transport.loopEnd = time`
      end

      def loop=(value)
        `Tone.Transport.loop = value`
      end

      def next_subdivision(subdivision)
        `Tone.Transport.nextSubdivision(subdivision)`
      end

      def schedule(time, &block)
        `Tone.Transport.schedule(#{block.to_n}, time)`
      end

      def schedule_once(time, &block)
        `Tone.Transport.scheduleOnce(#{block.to_n}, time)`
      end

      def schedule_repeat(time, &block)
        `Tone.Transport.scheduleRepeat(#{block.to_n}, time)`
      end

      def started?
        `Tone.Transport.state == 'started'`
      end

      def stopped?
        `Tone.Transport.state == 'stopped'`
      end

      def paused?
        `Tone.Transport.state == 'paused'`
      end

      def cancel
        `Tone.Transport.cancel()`
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
