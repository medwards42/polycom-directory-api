%w(./server ).each  { |lib| require lib}

task :default => [:run]

desc "run the app locally!"
  task :run do
    sh "bundle exec rackup -s thin -p 8000 -E development"
  end

desc "run the tests!"
  task :spec do
    require 'rspec/core/rake_task'
    RSpec::Core::RakeTask.new do |t|
      t.pattern = "spec/**/*_spec.rb"
  end
end

