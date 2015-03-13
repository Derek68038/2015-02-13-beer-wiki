DATABASE.results_as_hash = true

unless ActiveRecord::Base.connection.table_exists?(:styles)
  ActiveRecord::Base.connection.create_table :styles do |t|
    t.text :category
    t.text :color
    t.text :bitterness
    t.text :alcohol
    t.text :flavor
    t.text :related
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:beers)
  ActiveRecord::Base.connection.create_table :beers do |t|
    t.text :name
    t.integer :style_id
    t.text :color
    t.integer :ibu
    t.float :abv
    t.text :review
    t.text :date
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:breweries)
  ActiveRecord::Base.connection.create_table :breweries do |t|
    t.text :place
    t.text :description
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:beers_breweries)
  ActiveRecord::Base.connection.create_table :beers_breweries do |t|
    t.integer :beer_id
    t.integer :brewery_id
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:users)
  ActiveRecord::Base.connection.create_table :users do |t|
    t.text :user
    t.text :password
  end  
end
