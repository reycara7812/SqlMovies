


--@block
USE AMC;
  -- @block

INSERT INTO movies (title, description, runtime, genre, rating, imdb_score)
VALUES (
    'Quantum Skies',
    'Exploring the infinite possibilities of parallel universes, a group of scientists face unexpected challenges.',
    142,
    'sci-fi',
    'PG-13',
    8.5
);
-- @block
INSERT INTO movies (title, description, runtime, genre, rating, imdb_score)
VALUES (
    'The Hidden Key',
    'A thrilling mystery unfolds when a secret key is discovered, unlocking a series of enigmatic events.',
    '2h 10m',
    'mystery',
    'PG-13',
    7.8
);
--@block
INSERT INTO movies (title, description, runtime, genre, rating, imdb_score)
VALUES (
    'Midnight Rendezvous',
    'Love and suspense intertwine during a mysterious midnight encounter that changes lives forever.',
    '1h 45m',
    'romance',
    'PG',
    6.9
);


-- @block
INSERT INTO movies (title, description, runtime, genre, rating, imdb_score)
VALUES (
    'Forgotten Dreams',
    'A tale of lost memories and the journey to reclaim them takes an unexpected turn.',
    '1h 55m',
    'drama',
    'PG',
    6.7
);
-- @block
INSERT INTO movies (title, description, runtime, genre, rating, imdb_score)
VALUES (
    'Whispers in the Wind',
    'Whispers carry the secrets of a small town, unraveling a web of hidden truths.',
    '1h 50m',
    'thriller',
    'R',
    7.5
);

-- @block
CREATE TABLE movies (
    Title VARCHAR(100),
    Runtime INT,
    Genre VARCHAR(50),
    IMDB_Score DECIMAL(3,1),
    Rating VARCHAR(10)
);

-- @block
INSERT INTO movies (Title, Runtime, Genre, IMDB_Score, Rating)
VALUES 
    ('Howard the Duck', 110, 'Sci-Fi', 4.6, 'PG'),
    ('Lavalantula', 83, 'Horror', 4.7, 'TV-14'),
    ('Starship Troopers', 129, 'Sci-Fi', 7.2, 'PG-13'),
    ('Waltz With Bashir', 90, 'Documentary', 8.0, 'R'),
    ('Spaceballs', 96, 'Comedy', 7.1, 'PG'),
    ('Monsters Inc.', 92, 'Animation', 8.1, 'G');


-- @block
INSERT INTO movies (Title, Runtime, Genre, IMDB_Score, Rating)
VALUES 
    ('Inception', 148, 'Sci-Fi', 8.8, 'PG-13'),
    ('The Shawshank Redemption', 142, 'Drama', 9.3, 'R');


-- @block
SELECT * 
FROM movies
WHERE Genre = 'Sci-Fi';

-- @block
SELECT * 
FROM movies
WHERE Genre = (IMDB_Score > 7);


-- @block
SELECT * 
FROM movies
WHERE Rating = ('G' OR 'PG') AND Runtime < 100;


-- @block
SELECT AVG(Runtime) 
FROM movies
WHERE IMDB_Score > 7.5;


-- @block
SELECT id, Rating
FROM movies
WHERE Genre IN ('Horror', 'Documentary');

-- @block
UPDATE movies
SET Rating = 'R'
WHERE Title = 'Starship Troopers';


-- @block
SELECT Rating, AVG(IMDB_Score) AS Avg_Score, MAX(IMDB_Score) AS Max_Score, MIN(IMDB_Score) AS Min_Score
FROM movies
GROUP BY Rating
HAVING COUNT(*) > 1;
-- @block
DELETE FROM movies
WHERE Rating = 'R';
-- @block
SELECT *
FROM movies
ORDER BY Runtime DESC
LIMIT 5;
-- @block
SELECT Genre, AVG(Runtime) AS Avg_Runtime
FROM movies
GROUP BY Genre;


-- @block
CREATE TABLE actors (
    ActorID INT PRIMARY KEY AUTO_INCREMENT,
    ActorName VARCHAR(100) NOT NULL,
    MovieID INT,
    FOREIGN KEY (MovieID) REFERENCES movies(id)
);