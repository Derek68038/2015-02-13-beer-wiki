require 'rubygems'
require 'bundler/setup'
require "sinatra/activerecord"
require "sinatra"
# require "sqlite3"
require "beer_mapping"
require "bcrypt"
require "pry"
enable :sessions

# DATABASE = SQLite3::Database.new("./database/beer_wiki.db")
configure :development do
 set :database, {adapter: "sqlite3", database: "./database/beer_wiki.db"}
end

configure :production do
 db = URI.parse(ENV['DATABASE_URL'])
 ActiveRecord::Base.establish_connection(
 :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
 :host => db.host,
 :username => db.user,
 :password => db.password,
 :database => db.path[1..-1],
 :encoding => 'utf8'
 )
end

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


helpers Helper
