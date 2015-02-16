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
#
# Public Methods:
# None
#
# Private Methods:
# #initialize

class Beer
  
  include BeerWikiMethods
  
  attr_reader :id
  attr_accessor :beer, :style_id, :color, :ibu, :abv, :brewery_id
  
  def initialize(options)
    @beer        = options["beer"]
    @style_id    = options["style_id"]
    @color       = options["color"]
    @ibu         = options["ibu"]
    @abv         = options["abv"]
    @brewery_id  = options["brewery_id"]
  end
  
  # Public .fetch_by
  # Gets a list of beers with a given style or brewery id.
  #
  # Parameters:
  # style_id    - Integer: The style id to search for.
  # brewery_id  - Integer: The brewery id to search for.
  #
  # Returns:
  # Array of beer objects with the given style or brewery id.
  #
  # State Changes:
  # None
  
  def self.fetch_by(options) #ex: Beer.fetch_by("style_id" => 2)
    # options.length == 1
    v = []
    k = []
    options.each_key {|key| k << "#{key}"}
    options.each_value {|value| v << "#{value}"}

    field = k[0].to_s
    search_value = v[0].to_i

    search_query = "SELECT * FROM beers WHERE #{field} = #{search_value}"

    results = DATABASE.execute("#{search_query}")
    
    results

    results_as_objects = []

    results.each do |r|
      results_as_objects << self.new(r)
    end

    results_as_objects 
  end
  
end