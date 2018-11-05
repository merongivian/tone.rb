if RUBY_ENGINE == 'opal'
  require 'native'
  require 'tone/vendor'
  require 'tone/transport'
  require 'tone/event'
  require 'tone/synth'
  require 'tone/effect'
else
  require 'opal'

  Opal.append_path File.expand_path('../', __FILE__).untaint
end
