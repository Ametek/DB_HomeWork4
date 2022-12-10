-- 1. Количество исполнителей в каждом жанре
SELECT genre."name", COUNT(musician."name") FROM genre_musician
JOIN genre ON genre_id = genres_id 
JOIN musician ON musicians_id = musician_id 
GROUP BY genre."name";

-- 2. Количество треков, вошедших а вльбомы 2019-2020 годов
/*SELECT a.year_release, COUNT(t."name") FROM track t
JOIN album a ON t.album_id = a.album_id 
GROUP BY a.year_release 
HAVING a.year_release BETWEEN 2019 AND 2020;*/
SELECT a.year_release, COUNT(t."name") FROM track t
JOIN album a ON t.album_id = a.album_id 
WHERE a.year_release BETWEEN 2019 AND 2020
GROUP BY a.year_release; 

-- 3. Средняя продолжительность треков по каждому альбому
SELECT a."name", AVG(t.duration) FROM track t  
JOIN album a ON t.album_id = a.album_id 
GROUP BY a."name";

-- 4. Все исполнители, которые не выпустили альбомы в 2020 году
/*SELECT DISTINCT m."name" FROM musician_album ma 
JOIN musician m ON ma.musicians_id = m.musician_id 
JOIN album a ON ma.albums_id = a.album_id 
WHERE a.year_release != 2020;*/
SELECT DISTINCT m."name" FROM musician m 
WHERE m."name" NOT IN (
    SELECT DISTINCT m2."name" FROM musician m2
    JOIN musician_album ma ON ma.musicians_id = m2.musician_id 
    JOIN album a ON ma.albums_id = a.album_id 
    WHERE a.year_release = 2020)
ORDER BY m."name" 


-- 5. Названия сборников, в которых присутствует конкретный исполнитель
SELECT DISTINCT c."name" FROM musician_album ma 
JOIN musician m ON ma.musicians_id = m.musician_id 
JOIN album a ON ma.albums_id = a.album_id 
JOIN track t ON t.album_id = a.album_id 
JOIN track_collection tc ON tc.tracks_id = t.track_id 
JOIN collection c ON tc.collections_id = c.collection_id 
WHERE m."name" = 'Toni Braxton'
ORDER BY c."name";

-- 6. Название альбомов, в которых присутствуют исполнители более 1 жанра
/*SELECT a."name" FROM musician_album ma 
JOIN album a ON ma.albums_id = a.album_id 
WHERE ma.musicians_id = (
    SELECT musicians_id FROM genre_musician gm 
    GROUP BY musicians_id
    HAVING COUNT(gm.genres_id) > 1);*/
SELECT a."name" FROM genre_musician gm  
JOIN musician m ON gm.musicians_id = m.musician_id  
JOIN genre g ON gm.genres_id = g.genre_id   
JOIN musician_album ma ON ma.musicians_id = m.musician_id 
JOIN album a ON ma.albums_id  = a.album_id
GROUP BY a."name" 
HAVING COUNT(DISTINCT g."name") > 1;
                        
-- 7. Наименование треков, которые не входят в сборники
SELECT t."name" FROM track t
LEFT JOIN track_collection tc ON tc.tracks_id = t.track_id 
WHERE tc.collections_id IS NULL;

-- 8. Исполнитель, написавший самый короткий по продолжительности трек
/*SELECT m."name" FROM musician_album ma 
JOIN musician m ON ma.musicians_id = m.musician_id 
WHERE ma.albums_id = (
    SELECT t.album_id FROM track t
    WHERE t.duration = (SELECT MIN(t.duration) FROM track t));*/
SELECT m."name" FROM track t 
JOIN album a ON a.album_id = t.album_id
JOIN musician_album ma ON ma.albums_id = a.album_id
JOIN musician m ON m.musician_id = ma.musicians_id 
WHERE t.duration = (SELECT MIN(t.duration) FROM track t);


-- 9. Название альбомов, содержащих наименьшее количество треков
/*SELECT a."name" FROM (
    SELECT altr.album_id FROM (
        SELECT t.album_id, COUNT(t."name") FROM track t 
        GROUP BY t.album_id) altr 
    WHERE altr.count = (
        SELECT MIN(sec.count) FROM (
            SELECT t2.album_id, COUNT(t2."name") FROM track t2 
            GROUP BY t2.album_id) sec)) th 
LEFT JOIN album a ON a.album_id = th.album_id;*/
SELECT a."name" FROM album a 
JOIN track t ON a.album_id = t.album_id 
WHERE t.album_id IN (
    SELECT t.album_id FROM track t
    GROUP BY t.album_id 
    HAVING COUNT(t.track_id) = (
        SELECT COUNT(t.track_id) FROM track t
        GROUP BY t.album_id 
        ORDER BY COUNT 
        LIMIT 1
        )
    )
ORDER BY a."name";           