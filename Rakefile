require 'bundler'
Bundler.require
Bundler::GemHelper.install_tasks

require 'open-uri'

desc 'update js dependencies'
task :update_tone_js do
  js_lib_url = 'https://tonejs.github.io/build/Tone.min.js'
  js_lib_dest = File.join(File.dirname(__FILE__), './lib/tone/vendor.js')
  open(js_lib_url) do |f|
    File.write(js_lib_dest, f.readlines.join)
  end
end
