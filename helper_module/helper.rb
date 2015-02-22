
module Helper
  
  def style_id_to_name
    @style_name = @style[0].values[0]
    @style_name
  end  
  
  def brewery_id_to_name
    @brewery_name = @brewery[0].values[0] 
    @brewery_name
  end
   
end