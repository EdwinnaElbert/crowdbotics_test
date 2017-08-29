require 'factory_girl'
namespace :db do
    desc "Populate the database with phrases"
    task :populate, [:count] => [:environment] do |t, args|
      require File.expand_path("test/factories/phrases.rb")
      args.with_defaults(:count => 100)
      puts "Resetting the database"
      Rake::Task['db:reset'].invoke
      puts "Creating #{args[:count]} phrases"
      new_phrases = FactoryGirl.create_list(:phrase, args[:count].to_i)
    end
end
