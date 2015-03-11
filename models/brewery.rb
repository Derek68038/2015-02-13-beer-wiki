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

class Brewery < ActiveRecord::Base
  has_and_belongs_to_many :beers, join_table: :beers_breweries
  
  include BeerWikiMethods
  
end