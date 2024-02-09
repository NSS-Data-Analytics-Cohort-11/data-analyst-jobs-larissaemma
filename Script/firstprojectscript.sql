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
Where star_rating > 4.0

--answer: 416

--5.How many postings in the dataset have a review count between 500 and 1000?

SELECT count(review_count)
FROM data_analyst_jobs
WHERE review_count between 500 and 1000

--answer: 151

--6.Show the average star rating for companies in each state. The output should show the state as state and the average rating for the state as avg_rating. Which state shows the highest average rating?

SELECT location, avg(star_rating)
FROM data_analyst_jobs
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

SELECT title, avg(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY title 

--answer: 95

--10.Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT title, avg(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000
GROUP BY title 
ORDER BY avg(star_rating) desc


--answer: "Senior Data Analyst – Marketplace Analytics – Multiple Openi..."; 4.1999998090000000


--11.Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

SELECT Count (title)
FROM data_analyst_jobs
WHERE title like '%Analyst%'

--answer:1636

--12.How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT COUNT(title)
FROM data_analyst_jobs
WHERE title not like'%Analyst%' and title not like  '%Analytics%'

SELECT count (title)
FROM data_analyst_jobs
WHERE title not like '%Analy%' 

--answer: 39; "Analy"
