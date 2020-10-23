-- #1 1793
SELECT COUNT(*)
FROM data_analyst_jobs;

-- #2  ExxonMobil
SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- #3 21 in TN, 27 in TN or KY
SELECT location, COUNT(title)
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY'
GROUP BY location;

-- #4 3
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE star_rating > 4
AND location = 'TN';

-- #5 151
SELECT COUNT(title)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

-- #6 NE has the highest average rating
SELECT location AS state, ROUND(AVG(star_rating),2) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;

-- #7 881
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs;

-- #8 230
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE location = 'CA';

--#9 40 companies have more than 5000 reviews
SELECT company, ROUND(AVG(star_rating),2)
FROM data_analyst_jobs
WHERE review_count > 5000
AND company IS NOT NULL
GROUP BY company; 

SELECT COUNT(DISTINCT(company))
FROM data_analyst_jobs
WHERE review_count > 5000
AND company IS NOT NULL;

-- #10 6 way tie with a 4.20 average star rating
SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000 
GROUP BY company
ORDER BY avg_rating DESC; 

-- #11 1669 job titles, 774 distinct job titles 
SELECT COUNT(DISTINCT(title))
FROM data_analyst_jobs
WHERE LOWER (title) LIKE '%analyst%';

-- #12 the titles are all lower/uppercase, include "specialist", or acronyms
SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%' 
AND title NOT ILIKE '%Analytics%';

-- BONUS 
SELECT domain, COUNT(title)
FROM data_analyst_jobs
WHERE days_since_posting > 21
AND skill ILIKE '%SQL%'
AND domain IS NOT NULL
GROUP BY domain
ORDER BY COUNT(title) DESC;
