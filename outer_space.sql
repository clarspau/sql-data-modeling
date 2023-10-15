-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies
(
  galaxy_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);


CREATE TABLE stars
(
  star_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id INT REFERENCES galaxies(galaxy_id)
);

CREATE TABLE moons
(
  moon_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE planets
(
  planet_id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  star_id INT REFERENCES stars(star_id),
  moons_id INT[] REFERENCES moons(moon_id)
);

INSERT INTO galaxies (name)
VALUES
  ('Milky Way');

INSERT INTO stars (name, galaxy_id)
VALUES
  ('The Sun', 1),
  ('Proxima Centauri', 1),
  ('Gliese 876', 1);

INSERT INTO moons (name)
VALUES
  ('The Moon'),
  ('Phobos'),
  ('Deimos'),
  ('Naiad'),
  ('Thalassa'),
  ('Despina'),
  ('Galatea'),
  ('Larissa'),
  ('S/2004 N 1'),
  ('Proteus'),
  ('Triton'),
  ('Nereid'),
  ('Halimede'),
  ('Sao'),
  ('Laomedeia'),
  ('Psamathe'),
  ('Neso');

INSERT INTO planets (name, orbital_period_in_years, star_id, moons_id)
VALUES
  ('Earth', 1.00, 1, ARRAY[1]),
  ('Mars', 1.88, 1, ARRAY[2, 3]),
  ('Venus', 0.62, 1, NULL),
  ('Neptune', 164.8, 1, ARRAY[4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18]),
  ('Proxima Centauri b', 0.03, 2, NULL),
  ('Gliese 876 b', 0.23, 3, NULL);
