CREATE DATABASE catalog;

CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  label_title TEXT,
  label_color TEXT
);

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title TEXT,
  publisher TEXT,
  cover_state TEXT,
  publish_date DATE,
  archived BOOLEAN,
  label_id INTEGER,
  FOREIGN KEY (label_id) REFERENCES labels(id)
);


CREATE TABLE authors (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  PRIMARY key (id)
)

CREATE TABLE games (
  games_id INT,
  multiplayer BOOLEAN,
  last_played_at DATE,
  FOREIGN KEY (games_id) REFERENCES authors (id)
);
CREATE TABLE music_albums(
  id SERIAL PRIMARY KEY,
  publish_date DATE,
  archived VARCHAR,
  on_spotify BOOLEAN,
  genre_id SERIAL,
  FOREIGN KEY(genre_id) REFERENCES genres.id
);

CREATE TABLE genres(
  id SERIAL PRIMARY KEY,
  name VARCHAR
);


CREATE TABLE movies(
  id INT,
  silent BOOLEAN,
  source_id SERIAL,
  FOREIGN KEY(source_id) REFERENCES sources.id
);

CREATE TABLE sources(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255)
  PRIMARY KEY(id)
);