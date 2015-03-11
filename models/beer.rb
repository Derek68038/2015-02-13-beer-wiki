# Class: Beer
#
# Creates new beer objects/records for beers table in the beer wiki database.
# 
# Attributes:
# @id           - Integer: the primary key identifier for each beer.
# @name         - String: the beer name. 
# @style_id     - Integer: the identifier for each style.
# @color        - String: the color of the given beer.
# @ibu          - Integer: the bittering units of each beer.
# @abv          - Integer: the amount of alcohol in each beer.
# @brewery_id   - Integer: the identifier for each brewery.
# @review       - String: the beer review entered by the user.
# @date         - String: the date the beer was entered into the database.
# @style_name   - String: the name of the style when using it's style id.
# @brewery_name - String: the name of the brewery when using it's brewery id.
#
# Public Methods:
# #breweries_comma_separated
#
# Private Methods:
# #initialize

class Beer < ActiveRecord::Base
  belongs_to :style
  has_and_belongs_to_many :breweries, join_table: :beers_breweries
  
  include BeerWikiMethods #modules for class and instance methods
  include Helper #helper methods for route handlers
  
  # Public: #brewery_comma_name
  # Shows the brewery or breweries associated with an individual beer record.
  #
  # Parameters:
  # None.
  #
  # Returns
  # brewery_names.join(", "): A string of brewery names separated by commas.
  #
  # State Changes:
  # None.

  def breweries_comma_separated
    brewery_names = []
    
    breweries.each do |b|    #equivalent to self.breweries.each
      brewery_names << b.place
    end
    
    brewery_names.join(", ")
  end
  
 end