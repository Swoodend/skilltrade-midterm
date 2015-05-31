require 'rake'
require "sinatra/activerecord/rake"
require 'active_record'
require ::File.expand_path('../config/environment', __FILE__)

Rake::Task["db:create"].clear
Rake::Task["db:drop"].clear

# NOTE: Assumes SQLite3 DB
desc "create the database"
task "db:create" do
  touch 'db/db.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/db.sqlite3'
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc 'delete/create/migrate the database'
task 'db:empty' do
  rm_f 'db/db.sqlite3'
  touch 'db/db.sqlite3'
end

