module Tone
  module Synth
    class Base
      include Native

      alias_native :connect
      alias_native :disconnect
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

      def clone
        self.class.new(volume: volume)
      end

      def to_master
        self.connect(`Tone.Master`)
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
