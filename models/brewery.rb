# Class: Brewery
#
# Creates new brewery objects/records for breweries table in beer wiki database.
# 
# Attributes:
# @id        - Integer: the primary key identifier for each brewery.
# @brewery   - String: the brewery name. 
#
# Public Methods:
# None
#
# Private Methods:
# #initialize

class Brewery
  
  include BeerWikiMethods
  
  attr_reader :id
  attr_accessor :brewery
  
  def initialize(options)
    @brewery  = options["brewery"]
  end
  
end