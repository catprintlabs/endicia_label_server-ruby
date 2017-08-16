require 'bundler'
Bundler.setup
Bundler::GemHelper.install_tasks

require 'rake'
require 'rspec'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec') do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

Dir.glob('tasks/*.rake').each { |r| import r }

task default: :spec

task :console do
  exec 'irb -r endicia_label_server -I ./lib'
end
