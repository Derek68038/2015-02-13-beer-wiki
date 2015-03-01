# Class: Brewery
#
# Creates new brewery objects/records for breweries table in beer wiki database.
# 
# Attributes:
# @id          - Integer: the primary key identifier for each brewery.
# @brewery     - String: the brewery name. 
# @description - String: a short description of the brewery.
#
# Public Methods:
# None
#
# Private Methods:
# #initialize

class Brewery
  
  include BeerWikiMethods
  
  attr_reader :id
  attr_accessor :place, :description
  
  def initialize(options)
    @id          = options["id"]
    @place       = options["place"]
    @description = options["description"]
  end
  
end