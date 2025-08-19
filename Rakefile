require 'bundler'
Bundler.require
Bundler::GemHelper.install_tasks

require 'open-uri'
require 'fileutils'

desc 'last dev update'
task :update_dev do
  `npm install tone@next`
  FileUtils.mv('./node_modules/tone/build/Tone.js', './lib/tone/vendor.js')
end

desc 'last stable update'
task :update_stable do
  js_lib_url = 'https://tonejs.github.io/build/Tone.min.js'
  js_lib_dest = File.join(File.dirname(__FILE__), './lib/tone/vendor.js')
  open(js_lib_url) do |f|
    File.write(js_lib_dest, f.readlines.join)
  end
end

desc 'Start test server'
task :test_server do
  system('rackup -p 9292 -o 0.0.0.0')
end

desc 'Run audio tests'
task :test do
  puts "Starting test server..."
  puts "Open your browser to: http://localhost:9292"
  puts "Tests will run automatically"
  puts "Press Ctrl+C to stop"
  system('rackup -p 9292 -o 0.0.0.0')
end