# Class: Style
#
# Creates new style objects/records for styles table in beer wiki database.
# 
# Attributes:
# @id      - Integer: the primary key identifier for each style.
# @style   - String: the style name. 
#
# Public Methods:
# None
#
# Private Methods:
# #initialize

class Style
  
  include BeerWikiMethods
  
  attr_reader :id
  attr_accessor :style
  
  def initialize(options)
    @style = options["style"]
  end
  
end