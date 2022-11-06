
-- Part 4: Google Play Store Querying

-- 1
SELECT app_name 
FROM analytics 
WHERE id = '1880';

-- 2
SELECT id, app_name 
FROM analytics 
WHERE last_updated = 'August 01, 2018';

-- 3
SELECT category, COUNT(*) 
FROM analytics 
GROUP BY category;

-- 4
SELECT app_name, reviews 
FROM analytics 
LIMIT 5;

-- 5
SELECT app_name, reviews 
FROM analytics 
WHERE rating >= '4.8' 
LIMIT 1;

-- 6
SELECT category, AVG(rating) 
FROM analytics 
GROUP BY category 
ORDER BY avg 
DESC;

-- 7
SELECT app_name, price, rating 
FROM analytics 
WHERE rating < 3 
ORDER BY price 
DESC 
LIMIT 1;


-- 8
SELECT app_name, rating, min_installs 
FROM analytics 
WHERE rating > 0 
AND min_installs <= 50 
ORDER BY rating 
DESC;

-- 9
SELECT app_name 
FROM analytics 
WHERE rating < 3 
AND reviews >= 1000 
GROUP BY app_name;

-- 10
SELECT app_name, reviews, price 
FROM analytics 
WHERE price < 1.00 
AND price > 0.10 
LIMIT 10;

-- 11
SELECT app_name, last_updated 
FROM analytics 
WHERE last_updated = (
    SELECT MIN(last_updated) 
    FROM analytics
    );

-- 12
SELECT app_name, price 
FROM analytics 
WHERE price = (
    SELECT MAX(price) 
    FROM analytics
);

-- 13
SELECT COUNT(reviews) 
FROM analytics;

-- 14
SELECT category, 
FROM analytics 
GROUP BY category 
HAVING COUNT(*) > 300;

-- 15
SELECT app_name, reviews, min_installs,  
    min_installs / reviews AS proportion
FROM analytics
WHERE min_installs >= 100000
ORDER BY proportion DESC
LIMIT 1;