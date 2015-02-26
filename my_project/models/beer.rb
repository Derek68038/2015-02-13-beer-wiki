# Class: Beer
#
# Creates new beer objects/records for beers table in the beer wiki database.
# 
# Attributes:
# @id          - Integer: the primary key identifier for each beer.
# @beer        - String: the beer name. 
# @style_id    - Integer: the identifier for each style.
# @color       - String: the color of the given beer.
# @ibu         - Integer: the bittering units of each beer.
# @abv         - Integer: the amount of alcohol in each beer.
# @brewery_id  - Integer: the identifier for each brewery.
# @review      - String: the beer review entered by the user.
# @date        - String: the date the beer was entered into the database.
#
# Public Methods:
# None
#
# Private Methods:
# #initialize

class Beer
  
  include BeerWikiMethods #modules for class and instance methods
  include Helper #helper methods for route handlers
  
  attr_reader :id
  attr_accessor :beer, :style_id, :color, :ibu, :abv, :brewery_id, :review, :date, :style_name, :brewery_name
  
  def initialize(options)
    @beer         = options["beer"]
    @style_id     = options["style_id"]
    @color        = options["color"]
    @ibu          = options["ibu"]
    @abv          = options["abv"]
    @brewery_id   = options["brewery_id"]
    @review       = options["review"]
    @date         = options["date"]
    @style_name   = options["style_name"]
    @brewery_name = options["brewery_name"]
  end
  
  def fetch_breweries
    DATABASE.execute("SELECT brewery_id FROM beers_breweries WHERE beer_id = #{id}")
  end
  # Public .fetch_by
  # Gets a list of beers matching the key value pair entered.
  #
  # Parameters:
  # options - Hash: The key is the chosen column and the value is the search value for that column.
  #
  # Returns:
  # An array of objects.
  #
  # State Changes:
  # None
  
  def self.fetch_by(options) #ex: Beer.fetch_by("style_id" => 2)
    v = []
    k = []
    options.each_key {|key| k << "#{key}"}
    options.each_value {|value| v << "#{value}"}

    field = k[0]
    search_value = v[0]

    search_query = "SELECT * FROM beers WHERE #{field} = '#{search_value}'"
    # binding.pry
    results = DATABASE.execute("#{search_query}")
    
    results

    results_as_objects = []

    results.each do |r|
      results_as_objects << self.new(r)
    end

    results_as_objects 
  end
  
end