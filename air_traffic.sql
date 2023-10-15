-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers
(
  passenger_id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE flights
(
  flight_id SERIAL PRIMARY KEY,
  airline_name TEXT NOT NULL,
  departure_city TEXT NOT NULL,
  departure_country TEXT NOT NULL,
  arrival_city TEXT NOT NULL,
  arrival_country TEXT NOT NULL
);

CREATE TABLE flight_tickets
(
  ticket_id SERIAL PRIMARY KEY,
  passenger_id INT REFERENCES passengers(passenger_id),
  flight_id INT REFERENCES flights(flight_id),
  seat_number TEXT NOT NULL,
  departure_time TIMESTAMP NOT NULL,
  arrival_time TIMESTAMP NOT NULL
);

INSERT INTO passengers (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO flights (airline_name, departure_city, departure_country, arrival_city, arrival_country)
VALUES
  ('United Airlines', 'Washington, DC', 'United States', 'Seattle', 'United States'),
  ('British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
  ('Delta Air Lines', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
  ('TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
  ('Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
  ('United Airlines', 'New York', 'United States', 'Charlotte', 'United States'),
  ('American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
  ('American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
  ('Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');
  
INSERT INTO flight_tickets (passenger_id, flight_id, seat_number, departure_time, arrival_time)
VALUES
  (1, 1, '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00'),
  (2, 2, '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00'),
  (3, 3, '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00'),
  (1, 4, '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00'),
  (4, 5, '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00'),
  (2, 6, '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00'),
  (5, 7, '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00'),
  (6, 8, '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00'),
  (5, 9, '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00'),
  (7, 9, '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00');