-- 1.How many rows are in the data_analyst_jobs table?

SELECT *
FROM data_analyst_jobs

--answer: 1793

--2.Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT company , star_rating
FROM data_analyst_jobs
Limit 10

--answer: ExxonMobil

--3.How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT count (location)
FROM data_analyst_jobs
WHERE location in ('TN','KY')

--answer a. 21 b.27

--4. How many postings in Tennessee have a star rating above 4?

SELECT count (star_rating)
FROM data_analyst_jobs
Where location = 'TN' AND star_rating > 4.0

--answer: 3

--5.How many postings in the dataset have a review count between 500 and 1000?

SELECT count(review_count)
FROM data_analyst_jobs
WHERE review_count between 500 and 1000

--answer: 151

--6.Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?

SELECT location, avg(star_rating) as avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY Location
ORDER BY avg(star_rating) desc

--answer: NE

--7.Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT DISTINCT(title)
FROM data_analyst_jobs

--answer: 881

--8.How many unique job titles are there for California companies?

SELECT COUNT(DISTINCT(title)) 
FROM data_analyst_jobs
WHERE location = 'CA'

--answer: 230

--9.Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT company, avg(star_rating) as avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000
AND company IS NOT NULL
GROUP BY company 

--answer: 40

--10.Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company, avg(star_rating)
FROM data_analyst_jobs
WHERE company IS NOT NULL
GROUP BY company 
HAVING MIN(review_count) > 5000
ORDER BY avg(star_rating) desc;


--answer: "General Motors","Unilever","Microsoft","Nike","American Express","Kaiser Permanente";4.1999998090000000


--11.Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

SELECT DISTINCT (title)
FROM data_analyst_jobs
WHERE title ilike '%Analyst%'

--answer:774

--12.How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT COUNT(title)
FROM data_analyst_jobs
WHERE title not ilike'%Analyst%' and title not ilike  '%Analytics%'

SELECT count (title)
FROM data_analyst_jobs
WHERE title not ilike '%Analy%' 

--answer: 4; "Analy"

--BONUS: You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks.

SELECT domain AS industry, count (*) as num_sql_jobs
FROM (
	SELECT *
	FROM data_analyst_jobs
	WHERE skill ILIKE '%SQL%'
		AND days_since_posting >21) as sql_jobs
GROUP BY industry
HAVING domain IS NOT NULL
ORDER BY num_sql_jobs DESC;
--other way 

SELECT domain, COUNT(title)
FROM data_analyst_jobs
WHERE skill ILIKE '%sql%'
AND days_since_posting > (7*3)
AND domain IS NOT NULL
GROUP BY domain
ORDER BY COUNT(title) DESC;