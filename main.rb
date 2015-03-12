require 'rubygems'
require 'bundler/setup'
require "sinatra/activerecord"
require "sinatra"
require "sqlite3"
require "beer_mapping"
require "bcrypt"
require "pry"

DATABASE = SQLite3::Database.new("./database/beer_wiki.db")


require_relative "database/database_methods"
require_relative "helpers/helper"
require_relative "models/beer"
require_relative "models/style"
require_relative "models/brewery"
require_relative "models/user"
require_relative "database/database_setup"
require_relative "controllers/main_pages"
require_relative "controllers/main_links"
require_relative "controllers/delete_routes"
require_relative "controllers/add_routes"
set :database, {adapter: "sqlite3", database: "./database/beer_wiki.db"}

helpers Helper
