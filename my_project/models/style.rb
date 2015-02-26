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
  attr_accessor :style, :color, :bitterness, :alcohol, :flavor, :related
  
  def initialize(options)
    @id         = options["id"]
    @style      = options["style"]
    @color      = options["color"]
    @bitterness = options["bitterness"]
    @alcohol    = options["alcohol"]
    @flavor     = options["flavor"]
    @related    = options["related"]
  end
  
end