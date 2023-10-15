-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

-- Create a table for artists
CREATE TABLE artists
(
  artist_id SERIAL PRIMARY KEY,
  artist_name TEXT NOT NULL
);

-- Create a table for albums
CREATE TABLE albums
(
  album_id SERIAL PRIMARY KEY,
  album_name TEXT NOT NULL
);

-- Create a table for songs
CREATE TABLE songs
(
  song_id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artist_id INT REFERENCES artists(artist_id),
  album_id INT REFERENCES albums(album_id),
  producers TEXT[] NOT NULL
);

-- Insert sample data into artists and albums tables
INSERT INTO artists (artist_name)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Carey'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ('Destiny''s Child');

INSERT INTO albums (album_name)
VALUES
  ('Middle of Nowhere'),
  ('A Night at the Opera'),
  ('Daydream'),
  ('A Star Is Born'),
  ('Silver Side Up'),
  ('The Blueprint 3'),
  ('Prism'),
  ('Hands All Over'),
  ('Let Go'),
  ('The Writing''s on the Wall');

-- Insert sample data into songs table
INSERT INTO songs (title, duration_in_seconds, release_date, artist_id, album_id, producers)
VALUES
  ('MMMBop', 238, '1997-04-15', 1, 1, '{"Dust Brothers", "Stephen Lironi"}'),
  ('Bohemian Rhapsody', 355, '1975-10-31', 2, 2, '{"Roy Thomas Baker"}'),
  ('One Sweet Day', 282, '1995-11-14', 3, 3, '{"Walter Afanasieff"}'),
  ('Shallow', 216, '2018-09-27', 4, 4, '{"Benjamin Rice"}'),
  ('How You Remind Me', 223, '2001-08-21', 5, 5, '{"Rick Parashar"}'),
  ('New York State of Mind', 276, '2009-10-20', 6, 6, '{"Al Shux"}'),
  ('Dark Horse', 215, '2013-12-17', 7, 7, '{"Max Martin", "Cirkut"}'),
  ('Moves Like Jagger', 201, '2011-06-21', 8, 8, '{"Shellback", "Benny Blanco"}'),
  ('Complicated', 244, '2002-05-14', 9, 9, '{"The Matrix"}'),
  ('Say My Name', 240, '1999-11-07', 10, 10, '{"Darkchild"}');
