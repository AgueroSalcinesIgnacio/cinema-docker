
create table genres (
  id bigint primary key generated always as identity,
  name text not null
);

create table directors (
  id bigint primary key generated always as identity,
  name text not null,
  birthdate date,
  nationality text
);

create table actors (
  id bigint primary key generated always as identity,
  name text not null,
  birthdate date,
  nationality text
);

create table movies (
  id bigint primary key generated always as identity,
  title text not null,
  release_year int,
  genre_id bigint references genres (id),
  director_id bigint references directors (id),
  rating numeric(3, 2)
);

create table movie_actors (
  movie_id bigint references movies (id),
  actor_id bigint references actors (id),
  primary key (movie_id, actor_id)
);

create table reviews (
  id bigint primary key generated always as identity,
  movie_id bigint references movies (id),
  review_text text,
  rating numeric(3, 2),
  review_date date
);


INSERT INTO genres (name) VALUES
('Action'),
('Comedy'),
('Drama'),
('Horror'),
('Science Fiction');


INSERT INTO directors (name, birthdate, nationality) VALUES
('Christopher Nolan', '1970-07-30', 'British-American'),
('Quentin Tarantino', '1963-03-27', 'American'),
('Steven Spielberg', '1946-12-18', 'American'),
('Martin Scorsese', '1942-11-17', 'American'),
('Ridley Scott', '1937-11-30', 'British');


INSERT INTO actors (name, birthdate, nationality) VALUES
('Leonardo DiCaprio', '1974-11-11', 'American'),
('Brad Pitt', '1963-12-18', 'American'),
('Scarlett Johansson', '1984-11-22', 'American'),
('Tom Hanks', '1956-07-09', 'American'),
('Natalie Portman', '1981-06-09', 'Israeli-American');


INSERT INTO movies (title, release_year, genre_id, director_id, rating) VALUES
('Inception', 2010, 5, 1, 8.8),
('Pulp Fiction', 1994, 1, 2, 8.9),
('Jurassic Park', 1993, 5, 3, 8.1),
('The Wolf of Wall Street', 2013, 2, 4, 8.2),
('Gladiator', 2000, 1, 5, 8.5);

INSERT INTO movie_actors (movie_id, actor_id) VALUES
(1, 1);