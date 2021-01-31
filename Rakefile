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
  `npm install tone`
  FileUtils.mv('./node_modules/tone/build/Tone.js', './lib/tone/vendor.js')
end
