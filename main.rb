require 'pry'

require "sqlite3"

DATABASE = SQLite3::Database.new("beer_wiki.db")

require_relative "program_methods.rb"
require_relative "setup.rb"
require_relative "beer.rb"
require_relative "style.rb"
require_relative "brewery.rb"

binding.pry