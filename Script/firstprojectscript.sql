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
Where star_rating >= 4.0

--answer: 573

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