# Class: Style
#
# Creates new style objects/records for styles table in beer wiki database.
# 
# Attributes:
# @id         - Integer: the primary key identifier for each style.
# @type       - String: the style name. 
# @color      - String: the color range.
# @bitterness - String: the bitterness range.
# @alcohol    - String: the alcohol range.
# @flavor     - String: a short description of the style flavor.
# @related    - String: related beer styles.
#
# Public Methods:
# None
#
# Private Methods:
# #initialize

class Style
  
  include BeerWikiMethods
  
  attr_reader :id
  attr_accessor :type, :color, :bitterness, :alcohol, :flavor, :related
  
  def initialize(options)
    @id         = options["id"]
    @type       = options["type"]
    @color      = options["color"]
    @bitterness = options["bitterness"]
    @alcohol    = options["alcohol"]
    @flavor     = options["flavor"]
    @related    = options["related"]
  end
  
end