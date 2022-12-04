INSERT INTO genre (name) --жанры
VALUES ('pop'),
       ('hip hop'),
       ('techno'),
       ('rock'),
       ('alternative'),
       ('industrial'),
       ('gothic');

INSERT INTO musician (name) --исполнители
VALUES ('Toni Braxton'),
       ('Sandra'),
       ('Drake'),
       ('Post Malone'),
       ('Nina Kraviz'),
       ('Evanescence'),
       ('Fall Out Boy'),
       ('Queen'),
       ('Unreal'),
       ('Real');

INSERT INTO album (name, year_release) --альбомы
VALUES ('Sex & Cigarettes', 2018),
       ('Spell my name', 2020),
       ('The Wheel Of Time', 2002),
       ('Stay in Touch', 2012),
       ('Scorpion', 2018),
       ('Holliwoods Bleeding', 2019),
       ('Dont You Mess with Cupid', 2018),
       ('Pain In The Ass', 2009),
       ('Anywhere But Home', 2004),
       ('Believers Never Die', 2019),
       ('Greatest Hits In Japan', 2020),
       ('News Of The World', 1977),
       ('Не в этом мире', 2008),
       ('Ангелы звездного света', 2021);
       
INSERT INTO track (name, duration, album_id) --треки
VALUES ('My Heart', 4.13, 1),
       ('Deadwood', 3.98, 1),
       ('Spell my name', 3.35, 2),
       ('I Close My Eyes', 4.08, 3),
       ('Infinite Kiss', 2.88, 4),
       ('Nonstop', 3.97, 5),
       ('Allergic', 2.60, 6),
       ('Hexagraphic', 5.33, 7),
       ('Pain In The Ass', 6.67, 8),
       ('My Immortal', 4.63, 9),
       ('Immortals', 3.15, 10),
       ('The Last Of The Real Ones', 3.87, 10),
       ('The Show Must Go On', 4.52, 11),
       ('We Will Rock You', 2.02, 12),
       ('Проклятье мёртвых роз', 7.05, 13),
       ('Призрачный рай', 4.55, 14),
       ('Unknown', 6.66, 14);
      
INSERT INTO track (name, duration, album_id) -- Добавка)
VALUES ('Known', 5.55, 14);
       
INSERT INTO collection (name, year_release) --сборники
VALUES ('Not my collection', 2015),
       ('Collection 2', 2016),
       ('Collection 3', 2017),
       ('Collection 4', 2018),
       ('Collection 5', 2019),
       ('Collection 6', 2019),
       ('Collection 7', 2020),
       ('My collection', 2021);
       
INSERT INTO genre_musician (genres_id, musicians_id) --промежуточная жанр-исполнитель
VALUES (1, 1),
       (1, 2),
       (2, 3),
       (2, 4),
       (3, 5),
       (4, 6),
       (4, 8),
       (5, 7),
       (6, 9),
       (7, 10);
      
INSERT INTO genre_musician (genres_id, musicians_id) --Добавка)
VALUES (7, 9);
       
INSERT INTO musician_album (musicians_id, albums_id) --промежуточная исполнитель-альбом
VALUES (1, 1),
       (1, 2),
       (2, 3),
       (2, 4),
       (3, 5),
       (4, 6),
       (5, 7),
       (5, 8),
       (6, 9),
       (7, 10),
       (8, 11),
       (8, 12),
       (9, 13),
       (9, 14),
       (10, 14);
       
INSERT INTO track_collection (collections_id, tracks_id) --промежуточная трек-сборник
VALUES (1, 1),
       (1, 2),
       (2, 3),
       (2, 4),
       (3, 5),
       (3, 6),
       (4, 7),
       (4, 8),
       (5, 9),
       (5, 10),
       (6, 11),
       (6, 12),
       (7, 13),
       (7, 14),
       (8, 15),
       (8, 16);