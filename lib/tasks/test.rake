namespace :test do
  task :coverage do
    require 'simplecov'
    SimpleCov.start 'rails' # feel free to pass block
    # require 'coveralls'
    # Coveralls.wear! 'rails'

    Rake::Task["test"].execute
  end
end
