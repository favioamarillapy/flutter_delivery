CREATE TABLE promotions (id INTEGER PRIMARY KEY, title TEXT NOT NULL, subtitle TEXT NOT NULL, discount TEXT NOT NULL, image TEXT NOT NULL);
CREATE TABLE favorite (id INTEGER PRIMARY KEY, productid INTEGER NOT NULL);
CREATE TABLE cart (id INTEGER PRIMARY KEY, productid INTEGER NOT NULL, quantity INTEGER NOT NULL);