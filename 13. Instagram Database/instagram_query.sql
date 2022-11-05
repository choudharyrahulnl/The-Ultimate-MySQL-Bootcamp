# INSTAGRAM DATABASE
USE ig_clone;

# FIND 5 OLDEST USERS
SELECT username FROM users ORDER BY created_at LIMIT 5;

# WHAT DAY OF WEEK DO MOST USERS REGISTER ON
# WE CAN'T DO GROUP BY ON created_by DIRECTLY AS ITS HAS TIMESTAMP AS WELL WHICH MAKE EACH ROW UNIQUE
# SO FIRST WE GET THE DAY NAME FROM created_at & THEN DO GROUP BY ON THAT DAY NAME
SELECT
    DAYNAME(created_at) AS day,
    COUNT(*) AS count
FROM users
GROUP BY day ORDER BY count DESC LIMIT 1;

# SEND EMAIL TO INACTIVE USERS WHO DIDN'T POSTED ANY PHOTO
# photos.id IS NULL OR user_id IS NULL BOTH ARE CORRECT
SELECT username
FROM users
         LEFT JOIN photos
                   ON users.id = photos.user_id
WHERE photos.id IS NULL;

# MOST LIKES ON SINGLE PHOTO
SELECT u.username,p.id,p.image_url,COUNT(*) AS likes
FROM photos p
    INNER JOIN likes l ON l.photo_id = p.id
    INNER JOIN users u ON u.id = p.user_id
GROUP BY p.id
ORDER BY likes DESC LIMIT 1;

# HOW MANY TIMES DOES AVG USERS POST
SELECT (SELECT Count(*)
        FROM   photos) / (SELECT Count(*)
                          FROM   users) AS avg;

# TOP 5 MOST COMMONLY USED HASHTAGS
SELECT tag_name,COUNT(*) AS tag_count
FROM photo_tags
INNER JOIN tags ON tags.id = photo_tags.tag_id
GROUP BY tag_id
ORDER BY tag_count DESC LIMIT 5;

# FIND USERS WHO HAVE LIKED EVERY SINGLE PHOTO (BOTS)
SELECT username,COUNT(*) as num_likes
FROM users
INNER JOIN likes ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING num_likes = (SELECT COUNT(*) FROM photos);
