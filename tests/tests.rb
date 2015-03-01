require 'pry'
require 'minitest/autorun'
require "sqlite3"
require "beer_mapping"

DATABASE = SQLite3::Database.new("new_beer_test.db")

require_relative '../database/database_setup.rb'
require_relative '../database/database_methods.rb'
require_relative '../helpers/helper'
require_relative '../models/beer.rb'
require_relative '../models/brewery.rb'
require_relative '../models/style.rb'


class BeerTest < Minitest::Test
  
  include BeerWikiMethods
  
  def setup
    DATABASE.execute("DELETE FROM beers")
    DATABASE.execute("DELETE FROM breweries")
    DATABASE.execute("DELETE FROM styles")
    DATABASE.execute("DELETE FROM beers_breweries")
  end
  
  def test_beer_creation_and_insert_method
    assert_equal(0, Beer.show_all_beer_with_brewery_and_style.length)
    beer = Beer.new({"name" => "Certified Evil", "style_id" => 5,"color" => "Black", "ibu" => 55, 
                      "abv" => 9, "brewery_id" => ["9"], "review" => "Good", "date" => "02/21/2015"})
  
    beer.insert("beers")   
    
    results = DATABASE.execute("SELECT name FROM beers WHERE id = #{beer.id}")
  
    added_beer = results[0]
    
    assert_equal(1, Beer.show_all_beer_with_brewery_and_style.length)
    assert_equal("Certified Evil", added_beer["name"])
  end
  
  def test_fetch_by_method
    assert_equal(0, Beer.fetch_by("style_id" => 9).length)
    beer1 = Beer.new({"name" => "Certified Evil", "style_id" => 5,"color" => "Black", "ibu" => 55, 
                     "abv" => 9, "brewery_id" => ["7"], "review" => "Good", "date" => "02/21/2015"})
                     
    beer2 = Beer.new({"name" => "Certified Not So Evil", "style_id" => 5,"color" => "Black", "ibu" => 55, 
                     "abv" => 9, "brewery_id" => ["7"], "review" => "Ok", "date" => "02/14/2015"})

    beer3 = Beer.new({"name" => "Certified Good", "style_id" => 6,"color" => "Black", "ibu" => 55, 
                     "abv" => 9, "brewery_id" => ["7"], "review" => "Not great", "date" => "02/28/2015"})
                
    beer1.insert("beers")
    beer2.insert("beers")
    beer3.insert("beers")
    
    beer_name = Beer.fetch_by("style_id" => 6)
    b = beer_name[0]

    assert_equal(2, Beer.fetch_by("style_id" => 5).length)
    assert_equal("Certified Good", b.name)
  end
  
  def test_style_id_to_name
    beer = Beer.new({"name" => "Certified Evil", "style_id" => 1,"color" => "Black", "ibu" => 55, 
                     "abv" => 9, "brewery_id" => ["9"], "review" => "Good", "date" => "02/21/2015"})

    beer_style = Style.new({"type" => "American Stout"})

    beer.insert("beers")
    beer_style.insert("styles")

    style = DATABASE.execute("SELECT type FROM styles WHERE id = #{beer.style_id}")
    style_name = style[0].values[0]

    assert_equal("American Stout", style_name)
  end
     
  def test_brewery_id_to_name
    beer = Beer.new({"name" => "Certified Evil", "style_id" => 1,"color" => "Black", "ibu" => 55, 
                     "abv" => 9, "brewery_id" => ["1"], "review" => "Good", "date" => "02/21/2015"})

    beer_brewery = Brewery.new({"place" => "Lucky Bucket Brewing Company"})

    beer.insert("beers")
    beer_brewery.insert("breweries")
  
    brewery = DATABASE.execute("SELECT place FROM breweries WHERE id = #{beer.brewery_id[0]}")
    brewery_name = brewery[0].values[0]

    assert_equal("Lucky Bucket Brewing Company", brewery_name)
  end
   
  def test_all_method
    assert_equal(0, Beer.show_all_beer_with_brewery_and_style.length)
    beer = Beer.new({"name" => "Certified Evil", "style_id" => 5,"color" => "Black", "ibu" => 55, 
                     "abv" => 9, "brewery_id" => ["9"], "review" => "Good", "date" => "02/21/2015"})

    beer.insert("beers")

    assert_equal(1, Beer.show_all_beer_with_brewery_and_style.length)
  end
     
  def test_find_method
    beer = Beer.new({"name" => "Certified Evil", "style_id" => 5,"color" => "Black", "ibu" => 55, 
                     "abv" => 9, "brewery_id" => ["9"], "review" => "Good", "date" => "02/21/2015"})

    beer.insert("beers")

    results1 = Beer.find("beers" => 1)

    assert_equal("Good", results1.review)      
  end                
  
  def test_delete_method
    assert_equal(0, Beer.show_all_beer_with_brewery_and_style.length)
    beer1 = Beer.new({"name" => "Certified Evil", "style_id" => 5,"color" => "Black", "ibu" => 55, 
                      "abv" => 9, "brewery_id" => ["9"], "review" => "Good", "date" => "02/21/2015"})
                     
    beer2 = Beer.new({"name" => "Certified Evil", "style_id" => 5,"color" => "Black", "ibu" => 55, 
                      "abv" => 9, "brewery_id" => ["9"], "review" => "Ok", "date" => "02/14/2015"})

    beer3 = Beer.new({"name" => "Certified Evil", "style_id" => 5,"color" => "Black", "ibu" => 55, 
                      "abv" => 9, "brewery_id" => ["9"], "review" => "Not great", "date" => "02/28/2015"})

    beer1.insert("beers")
    beer2.insert("beers")
    beer3.insert("beers")
    
    assert_equal(3, Beer.show_all_beer_with_brewery_and_style.length)

    Beer.delete("beers" => 1)

    assert_equal(2, Beer.show_all_beer_with_brewery_and_style.length)
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
    
    
    
    
    
    
    
    