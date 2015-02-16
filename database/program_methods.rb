module BeerWikiMethods
  
  def self.included(base)
     base.extend BeerWikiClassMethods
  end
  
  module BeerWikiClassMethods
    
    # Input all class methods.
    
    # Public: .all
    # Get all the records in the products table.
    #
    # Parameters:
    # None
    #
    # Returns: 
    # Array: Records from the products table displaying all fields.
    #
    # State Changes:
    # None
    
    def all(table_name)
      results = DATABASE.execute("SELECT * FROM #{table_name}")
      
      results_as_objects = []

      results.each do |r|
        results_as_objects << self.new(r)
      end
      
      results_as_objects
    end
    
    # Public: .find
    # Fetch a given record from products table.
    #
    # Parameters:
    # record_id - Integer: The product's ID in the table.
    #
    # Returns:
    # Array containing one row as a hash.
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
    # Syntax to delete a record in the products table who's id matches the 
    # inputted record id.
    #
    # Parameters:
    # record_id - Integer: The id which you want to delete.
    #
    # Returns:
    # Empty array.
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
  
  # Public: #save
  # Updates the products table to changes made to an existing object in ruby.
  # 
  # Parameters:
  # None
  #
  # Returns:
  # Empty Array. Updates sql database with changes.
  #
  # State Changes:
  # Pushes all attributes to array while deleting @ symbol.
  
  def save(table_name)
    attributes = []
    
    instance_variables.each do |i|
      attributes << i.to_s.delete("@")
    end

    query_components_array = []

    attributes.each do |a|
      value = self.send(a)
  
      if value.is_a?(Integer)
        query_components_array << "#{a} = #{value}"
      else
        query_components_array << "#{a} = '#{value}'"
      end
    end

    query_string = query_components_array.join(", ")
    # example: name = 'Sumeet', age = 75, hometown = 'San Diego'
    
    DATABASE.execute("UPDATE #{table_name} SET #{query_string} WHERE id = #{id}")
  end
  
  # Public: #insert
  # Syntax to enter the Ruby object's arguments as a records' field values via 
  # sqlite3.
  #
  # Parameters:
  # None
  #
  # Returns: 
  # Integer - @id, "id" field value, generated by table upon creation and 
  # pulled from the record.
  # 
  # State ChangeS:
  # ???
  
  def insert(table_name)
    if table_name == "beers"
      DATABASE.execute("INSERT INTO beers (beer, style_id, 
                        color, ibu, abv, brewery_id) VALUES 
                        ('#{@beer}', #{@style_id}, '#{@color}', 
                        #{@ibu}, #{@abv}, #{@brewery_id})")
      @id = DATABASE.last_insert_row_id
    elsif table_name == "styles"
      DATABASE.execute("INSERT INTO styles (style) VALUES ('#{@style}')")
      @id = DATABASE.last_insert_row_id
    elsif table_name == "breweries"
      DATABASE.execute("INSERT INTO breweries (brewery, location) VALUES 
                        ('#{@brewery}', '#{@location}')")
      @id = DATABASE.last_insert_row_id
    end
  end 
  
end
