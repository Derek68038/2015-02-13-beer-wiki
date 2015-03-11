DATABASE.results_as_hash = true

DATABASE.execute("CREATE TABLE IF NOT EXISTS styles (id INTEGER PRIMARY KEY, category TEXT, color TEXT, 
                  bitterness TEXT, alcohol TEXT, flavor TEXT, related TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS beers (id INTEGER PRIMARY KEY, name TEXT, style_id 
                  INTEGER, color TEXT, ibu INTEGER, abv REAL, review TEXT, date 
                  TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS breweries (id INTEGER PRIMARY KEY, place TEXT, 
                  description TEXT)")

DATABASE.execute("CREATE TABLE IF NOT EXISTS beers_breweries (beer_id INTEGER, brewery_id INTEGER)")