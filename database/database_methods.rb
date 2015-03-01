module BeerWikiMethods
  
  def self.included(base)
     base.extend BeerWikiClassMethods
  end
  
  module BeerWikiClassMethods
    
    # Input all class methods.
    
    # Public: .show_all_styles_or_breweries
    # Gets a list of all the records in the styles or breweries tables.
    #
    # Parameters:
    # table_name - String: The table you want to show records from.
    #
    # Returns: 
    # An array of objects.
    #
    # State Changes:
    # None
    
    def show_all_styles_or_breweries(table_name)
      results = DATABASE.execute("SELECT * FROM #{table_name}")
      
      results_as_objects = []

      results.each do |r|
        results_as_objects << self.new(r)
      end
      
      results_as_objects
    end
    
    # Public: .find
    # Fetch a single record from the stated table.
    #
    # Parameters:
    # options - Hash: The key is the chosen table and the value is the id of the particular record.
    #
    # Returns:
    # An array containing one object.
    #
    # State Changes:
    # None
    
    def find(options)
      v = []
      k = []
      options.each_key {|key| k << "#{key}"}
      options.each_value {|value| v << "#{value}"}

      table = k[0].to_s
      record_id = v[0].to_i
      
      results = DATABASE.execute("SELECT * FROM #{table} WHERE id = #{record_id}")
      
      record_details = results[0] # hash of the record's details.
      record_details
      
      self.new(record_details)
    end
     
    # Public: .delete
    # Deletes a single record in the chosen table with the matching id. 
    #
    # Parameters:
    # options - Hash: The key is the chosen table and the value is the id of the particular record.
    #
    # Returns:
    # An array containing one object.
    #
    # State Changes:
    # None
    
    def delete(options)
      v = []
      k = []
      options.each_key {|key| k << "#{key}"}
      options.each_value {|value| v << "#{value}"}

      table = k[0].to_s
      record_id = v[0].to_i
      DATABASE.execute("DELETE FROM #{table} WHERE id = #{record_id}")
    end
    
  end
  
# Input all instance methods.
   
  # Public: #insert
  # Enters a new record into the chosen table.
  #
  # Parameters:
  # table_name - String: The table you want to enter the record into.
  #
  # Returns: 
  # Integer - the @id of new record entered.
  # 
  # State Changes:
  # Sets @id as the next numeric value in the database table.
  
  def insert(table_name)
    if table_name == "beers"
      sql_query = "INSERT INTO beers (name, style_id, color, ibu, abv, review, date) 
                   VALUES ('#{@name}', #{@style_id}, '#{@color}', #{@ibu}, #{@abv}, '#{@review}',
                   '#{@date}')"
      DATABASE.execute(sql_query)
      @id = DATABASE.last_insert_row_id
      
      @brewery_id.each do |b|
        sql_query2 = "INSERT INTO beers_breweries (beer_id, brewery_id) VALUES (#{@id}, #{b})"
        DATABASE.execute(sql_query2)              
      end
      
    elsif table_name == "styles"
      DATABASE.execute("INSERT INTO styles (type, color, bitterness, alcohol, flavor, related) 
                        VALUES ('#{@type}', '#{@color}', '#{@bitterness}', '#{@alcohol}', 
                        '#{@flavor}', '#{@related}')")
      @id = DATABASE.last_insert_row_id
    
    elsif table_name == "breweries"
      DATABASE.execute("INSERT INTO breweries (place, description) VALUES ('#{@place}', 
                        '#{@description}')")
      @id = DATABASE.last_insert_row_id
    end
  end 
 
  # Public: #style_id_to_name
  # Fetches the style type which is associated with it's specific style id.
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
    @style = DATABASE.execute("SELECT type FROM styles WHERE id = #{style_id}")
    @style_name = @style[0].values[0]
    @style_name
  end
 
  # Public: #brewery_ids_to_name
  # Fetches the brewery place which is associated with the given brewery id.
  #
  # Parameters:
  # id - Integer: the id of the brewery in the breweries table.
  #
  # Returns
  # @brewery_name: The name of the brewery correlating to it's brewery id.
  #
  # State Changes:
  # Sets @brewery_name
   
  def brewery_ids_to_name(id)
    @brewery = DATABASE.execute("SELECT place FROM breweries JOIN beers_breweries ON breweries.id = 
    beers_breweries.brewery_id WHERE beers_breweries.brewery_id = #{id}")
    @brewery_name = @brewery[0].values[0]
    @brewery_name
  end
  
  # Public: #delete_brewery_id_to_name
  # Fetches the brewery place based on the name entered.
  #
  # Parameters:
  # None
  #
  # Returns
  # @brewery_name: The name of the brewery correlating to it's brewery id.
  #
  # State Changes:
  # Sets @brewery_name
  
  def delete_brewery_id_to_name
    @brewery = DATABASE.execute("SELECT place FROM breweries WHERE id = #{place}")
    @brewery_name = @brewery[0].values[0] 
    @brewery_name
  end

end
