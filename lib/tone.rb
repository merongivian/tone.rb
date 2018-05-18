if RUBY_ENGINE == 'opal'
  require 'tone/vendor'
  require 'tone/all'
else
  require 'opal'

  Opal.append_path File.expand_path('../', __FILE__).untaint
end
