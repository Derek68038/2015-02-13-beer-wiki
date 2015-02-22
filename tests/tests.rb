require 'minitest/autorun'

require "sqlite3"
require "beer_mapping"

DATABASE = SQLite3::Database.new("beer_test.db")

require_relative '../database/setup.rb'
require_relative '../database/program_methods.rb'
require_relative '../helper_module/helper'
require_relative '../models/beer.rb'
require_relative '../models/brewery.rb'
require_relative '../models/style.rb'


class BeerTest < Minitest::Test
  
  include BeerWikiMethods
  
  def setup
    DATABASE.execute("DELETE FROM beers")
    DATABASE.execute("DELETE FROM breweries")
    DATABASE.execute("DELETE FROM styles")
  end
  
  def test_beer_creation_and_insert_method
    beer = Beer.new({"beer" => "Certified Evil", "style_id" => 5,"color" => "Black", "ibu" => 55, 
                     "abv" => 9, "brewery_id" => 9, "review" => "Good", "date" => "02/21/2015"})
  
    beer.insert("beers")   
    
    results = DATABASE.execute("SELECT beer FROM beers WHERE id = #{beer.id}")
  
    added_beer = results[0]
    
    assert_equal(1, Beer.all("beers").length)
    assert_equal("Certified Evil", added_beer["beer"])
  end
  
  def test_fetch_by_method
    assert_equal(0, Beer.fetch_by("brewery_id" => 9).length)
    beer1 = Beer.new({"beer" => "Certified Evil", "style_id" => 5,"color" => "Black", "ibu" => 55, 
                     "abv" => 9, "brewery_id" => 9, "review" => "Good", "date" => "02/21/2015"})
                     
    beer2 = Beer.new({"beer" => "Certified Evil", "style_id" => 5,"color" => "Black", "ibu" => 55, 
                     "abv" => 9, "brewery_id" => 9, "review" => "Ok", "date" => "02/14/2015"})

    beer3 = Beer.new({"beer" => "Certified Evil", "style_id" => 5,"color" => "Black", "ibu" => 55, 
                     "abv" => 9, "brewery_id" => 9, "review" => "Not great", "date" => "02/28/2015"})

    beer1.insert("beers")
    beer2.insert("beers")
    beer3.insert("beers")

    assert_equal(3, Beer.fetch_by("brewery_id" => 9).length)
  end
  
  def test_style_id_to_name
    beer = Beer.new({"beer" => "Certified Evil", "style_id" => 1,"color" => "Black", "ibu" => 55, 
                     "abv" => 9, "brewery_id" => 9, "review" => "Good", "date" => "02/21/2015"})

    beer_style = Style.new({"style" => "American Stout"})

    beer.insert("beers")
    beer_style.insert("styles")

    style = DATABASE.execute("SELECT style FROM styles WHERE id = #{beer.style_id}")
    style_name = style[0].values[0]

    assert_equal("American Stout", style_name)
  end
     
  def test_brewery_id_to_name
    beer = Beer.new({"beer" => "Certified Evil", "style_id" => 1,"color" => "Black", "ibu" => 55, 
                     "abv" => 9, "brewery_id" => 1, "review" => "Good", "date" => "02/21/2015"})

    beer_brewery = Brewery.new({"brewery" => "Lucky Bucket Brewing Company"})

    beer.insert("beers")
    beer_brewery.insert("breweries")

    brewery = DATABASE.execute("SELECT brewery FROM breweries WHERE id = #{beer.brewery_id}")
    brewery_name = brewery[0].values[0]

    assert_equal("Lucky Bucket Brewing Company", brewery_name)
  end
   
  def test_all_method
    assert_equal(0, Beer.all("beers").length)
    beer = Beer.new({"beer" => "Certified Evil", "style_id" => 5,"color" => "Black", "ibu" => 55, 
                     "abv" => 9, "brewery_id" => 9, "review" => "Good", "date" => "02/21/2015"})

    beer.insert("beers")

    assert_equal(1, Beer.all("beers").length)
  end
     
  def test_find_method
    beer = Beer.new({"beer" => "Certified Evil", "style_id" => 5,"color" => "Black", "ibu" => 55, 
                     "abv" => 9, "brewery_id" => 9, "review" => "Good", "date" => "02/21/2015"})

    beer.insert("beers")

    results1 = Beer.find("beers" => 1)

    assert_equal("Good", results1.review)      
  end                
  
  def test_delete_method
    assert_equal(0, Beer.all("beers").length)
    beer1 = Beer.new({"beer" => "Certified Evil", "style_id" => 5,"color" => "Black", "ibu" => 55, 
                      "abv" => 9, "brewery_id" => 9, "review" => "Good", "date" => "02/21/2015"})
                     
    beer2 = Beer.new({"beer" => "Certified Evil", "style_id" => 5,"color" => "Black", "ibu" => 55, 
                      "abv" => 9, "brewery_id" => 9, "review" => "Ok", "date" => "02/14/2015"})

    beer3 = Beer.new({"beer" => "Certified Evil", "style_id" => 5,"color" => "Black", "ibu" => 55, 
                      "abv" => 9, "brewery_id" => 9, "review" => "Not great", "date" => "02/28/2015"})

    beer1.insert("beers")
    beer2.insert("beers")
    beer3.insert("beers")
    
    assert_equal(3, Beer.all("beers").length)

    Beer.delete("beers" => 1)

    assert_equal(2, Beer.all("beers").length)
  end
  
  def test_beer_mapping_api
    beer_bar = BeerMapping::API.new("cde4273a2c0ee01fedcd666524ca32bb") 
    
    beer_bar.find_by_name("Beertopia")
    beer_bar.locations
    beers = beer_bar.locations[0]

    assert_equal("Beertopia", beers.name)
    assert_equal("3570 Farnam Street", beers.street)
    assert_equal("Omaha", beers.city)
    assert_equal("NE", beers.state)
    assert_equal("68131", beers.zip)
    assert_equal("402-905-2603", beers.phone) 
  end
  
end
    
    
    
    
    
    
    
    