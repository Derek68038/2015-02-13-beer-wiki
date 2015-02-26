DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS styles (id INTEGER PRIMARY KEY, style TEXT, color TEXT, 
                  bitterness TEXT, alcohol TEXT, flavor TEXT, related TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS beers (id INTEGER PRIMARY KEY, beer TEXT, style_id INTEGER, 
                  color TEXT, ibu INTEGER, abv REAL, brewery_id INTEGER, review TEXT, date TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS breweries (id INTEGER PRIMARY KEY, brewery TEXT, description TEXT)")