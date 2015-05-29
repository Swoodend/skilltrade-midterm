require 'rake'
require "sinatra/activerecord/rake"
require 'active_record'
require ::File.expand_path('../config/environment', __FILE__)
require "./db/seed/users_importer"

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

desc 'populate the database with seed data'
task 'db:populate' do
  UsersImporter.import
end

desc 'delete/create/migrate the database'
task 'db:empty' do
  rm_f 'db/db.sqlite3'
  touch 'db/db.sqlite3'
end

desc 'drop/create/migrate/populate'
task 'db:nuke_and_populate' do
  rm_f 'db/db.sqlite3'
  Rake::Task["db:create"]
  Rake::Task["db:migrate"]
  UsersImporter.import
end  
