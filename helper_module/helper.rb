# Module: Helper
#
# Methods used in several route handlers.
#
# Attributes:
# None
#
# Public Methods:
# #style_id_to_name
# #brewery_id_to_name

module Helper
  
  # Public: #style_id_to_name
  #
  # Parameters:
  # None
  #
  # Returns
  # @style_name: The name of the style correlating to it's style id.
  #
  # State Changes:
  # Sets @style_name
  
  # def style_id_to_name
  #   @style = DATABASE.execute("SELECT style FROM styles WHERE id = #{@beer.style_id}")
  #   @style_name = @style[0].values[0]
  #   @style_name
  # end 
  def beer_mapper
    @beer = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb")
  end
  # Public: #brewery_id_to_name
  #
  # Parameters:
  # None
  #
  # Returns
  # @brewery_name: The name of the brewery correlating to it's brewery id.
  #
  # State Changes:
  # Sets @brewery_name
  
  # def brewery_id_to_name
  #   @brewery = DATABASE.execute("SELECT brewery FROM breweries WHERE id = #{@beer.brewery_id}")
  #   @brewery_name = @brewery[0].values[0]
  #   @brewery_name
  # end
   
end