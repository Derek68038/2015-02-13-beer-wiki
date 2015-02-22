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
  
  def style_id_to_name
    @style_name = @style[0].values[0]
    @style_name
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
  
  def brewery_id_to_name
    @brewery_name = @brewery[0].values[0] 
    @brewery_name
  end
   
end