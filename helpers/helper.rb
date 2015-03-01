# Module: Helper
#
# Methods used in several route handlers.
#
# Attributes:
# None
#
# Public Methods:
# #beer_mapper

module Helper
  
  # Public: #beer_mapper
  #
  # Parameters:
  # None
  #
  # Returns
  # An array showing all the beer attributes for my BeerMapping API.
  #
  # State Changes:
  # None
 
  def beer_mapper
    @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  end
   
end