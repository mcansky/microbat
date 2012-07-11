require "microbat"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new :spec

namespace :server do
  desc "Start server"
  task :start do
    Microbat::Server.run
  end
end
