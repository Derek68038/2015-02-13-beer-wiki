DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS styles (id INTEGER PRIMARY 
          KEY, style TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS beers (id INTEGER PRIMARY KEY,
          beer TEXT, style_id INTEGER, color TEXT, ibu INTEGER, abv
          INTEGER, brewery_id INTEGER)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS breweries (id INTEGER PRIMARY
          KEY, brewery TEXT, location TEXT)")