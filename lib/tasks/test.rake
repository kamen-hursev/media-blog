namespace :test do
  task :coverage do
    if ENV['TRAVIS']
      require 'coveralls'
      Coveralls.wear! 'rails'
    else
      require 'simplecov'
      SimpleCov.start 'rails' # feel free to pass block
    end
    Rake::Task["test"].execute
  end
end
