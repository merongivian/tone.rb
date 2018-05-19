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

      def schedule_after(time, &block)
        future_time = `Tone.Transport.seconds + time`
        `Tone.Transport.scheduleOnce(#{block.to_n}, Tone.TransportTime(future_time))`
      end
    end
  end
end
