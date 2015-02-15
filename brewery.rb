# Class: Brewery
#
# Creates new brewery objects/records for breweries table in beer wiki database.
# 
# Attributes:
# @id        - Integer: the primary key identifier for each brewery.
# @brewery   - String: the brewery name. 
# @location  - String: the location (city & state) of the brewery.
#
# Public Methods:
# None
#
# Private Methods:
# #initialize

class Brewery
  
  include BeerWikiMethods
  
  attr_reader :id
  attr_accessor :brewery, :location
  
  def initialize(options)
    @brewery  = options["brewery"]
    @location = options["location"]
  end
  
end