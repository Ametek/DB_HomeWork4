CREATE TABLE IF NOT EXISTS Genre ( --жанры
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Musician ( --исполнители
    musician_id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genre_Musician ( --промежуточная жанры-исполнители
    genres_id INTEGER REFERENCES Genre(genre_id),
    musicians_id INTEGER REFERENCES Musician(musician_id),
    CONSTRAINT pk PRIMARY KEY (genres_id, musicians_id)
);

CREATE TABLE IF NOT EXISTS Album ( --альбомы
    album_id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    year_release INTEGER
);

CREATE TABLE IF NOT EXISTS Musician_Album ( --промежуточная исполнители-альбомы
    musicians_id INTEGER REFERENCES Musician(musician_id),
    albums_id INTEGER REFERENCES Album(album_id),
    CONSTRAINT pk2 PRIMARY KEY (musicians_id, albums_id)
);

CREATE TABLE IF NOT EXISTS Track ( --треки
    track_id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    duration DOUBLE PRECISION,
    album_id INTEGER NOT NULL REFERENCES Album(album_id)
);

CREATE TABLE IF NOT EXISTS Collection ( --сборники
    collection_id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    year_release INTEGER
);

CREATE TABLE IF NOT EXISTS Track_Collection ( --промежуточная треки-сборники
    collections_id INTEGER REFERENCES Collection(collection_id),
    tracks_id INTEGER REFERENCES Track(track_id),
    CONSTRAINT pk3 PRIMARY KEY (collections_id, tracks_id)
);