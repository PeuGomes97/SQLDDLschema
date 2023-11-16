-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  type TEXT,
  radius DOUBLE PRECISION, 
  mass DOUBLE PRECISION,
  galaxy_id INT NOT NULL,
  FOREIGN KEY (galaxy_id) REFERENCES galaxies(id),
  
);

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  type TEXT,
  size BIGINT
);

CREATE TABLE orbits
(
  id SERIAL PRIMARY KEY,
  planet_id INT NOT NULL,
  galaxy_id INT NOT NULL,
  distance DOUBLE PRECISION, -- 
  orbital_period DOUBLE PRECISION, 
  FOREIGN KEY (planet_id) REFERENCES planets(id),
  FOREIGN KEY (galaxy_id) REFERENCES galaxies(id),
);



INSERT INTO planets
  (name, orbital_period_in_years, orbits_around, galaxy, moons)
VALUES
  ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
  ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
  ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
  ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
  ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');