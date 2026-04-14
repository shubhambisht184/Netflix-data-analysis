-- Netflix project 
create table Netflix(
show_id varchar(7),
type varchar(10),
title  varchar(150),
director varchar(210),
casts varchar(775),
country varchar(125),
date_added varchar(50),
release_year int,
rating varchar(10),
duration varchar(20),
genres varchar(90),
description varchar(250)
);
select * from netflix;

--1. count the number of movies vs tv shows 
select 
type,count(*) as total_content
from netflix 
group by type;

-- 2. find the most common rating movies and tv shows 
select type,
rating 
from
(
select 
type,rating,
count(*),
rank()over(partition by type order by count(*) desc) as ranking 
from netflix
group by 1,2
) as t1 
where 
ranking = 1


-- 3. List all movies released in a specific year(e.g,2020) 
select * from netflix
where type = 'Movie'
and 
release_year = 2020

-- 4. Find the top 5 countries with the most content on netflix 
select 
unnest(String_to_array(country,',')) as new_country,
count(show_id) as total_content 
from netflix
group by 1
order by 2 desc 
limit 5 

-- 5. Identify the longest movie? 
select * from netflix 
where type = 'Movie'
and 
duration = (select max(duration) from netflix)

-- 6. Find content added in the last 6 years
SELECT *
FROM netflix
WHERE 
    CASE 
        WHEN date_added ~ '^[0-9]{1,2}-[A-Za-z]{3}-[0-9]{2}$'
            THEN to_date(date_added,'DD-Mon-YY')
        WHEN date_added ~ '^[A-Za-z]+ [0-9]{1,2}, [0-9]{4}$'
            THEN to_date(date_added,'Month DD, YYYY')
    END
    >= current_date - INTERVAL '6 years';

	
-- 7. Find all the movie/tv show by director 'David Ayer'
select * from netflix 
where director ILIKE  '%David Ayer%'	

--8. Find all tv shows with more than 5 seasons 
select *
from netflix
	where 
	type = 'TV show'
	and 
	split_part(duration,'',1):: numeric >5
	
--9. count the number of content item in each genre 
select 
genres,
unnest(string_to_array(genres,',')) as genre,
count(show_id) as total_content
from netflix 
group by 1 

--8. find each year and the average of content release by india on netflix. retrun top 5 year with highest avg content release! 
SELECT 
    EXTRACT(YEAR FROM 
        CASE 
            WHEN date_added ~ '^[0-9]{1,2}-[A-Za-z]{3}-[0-9]{2}$'
                THEN to_date(date_added,'DD-Mon-YY')
            WHEN date_added ~ '^[A-Za-z]+ [0-9]{1,2}, [0-9]{4}$'
                THEN to_date(date_added,'Month DD, YYYY')
        END
    ) AS year,
    
    COUNT(*) AS total_content,

    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM netflix WHERE country LIKE '%India%'),
        2
    ) AS avg_content_per_year

FROM netflix
WHERE country LIKE '%India%'
GROUP BY 1
ORDER BY 1;

-- 11. list all movie that are documentaries 
select * from netflix 
where genres ILike '%documentaries%'

-- 12. find all content without a director 	
select * from netflix 
where 
director is null 

-- 13. find how many movie actor 'salman khan' appeared in last 12 years! 
select * from netflix 
where 
casts ilike '%salman khan%'
and 
release_year > Extract(year from current_date) - 12

-- 14. find the top 10 actor who have appeared in the heighest number of movie produced in india 
select
--show_id,
--casts,
unnest(String_to_Array(casts,',')) as actors,
count(*) as	 total_content 
from netflix 
where country ilike '%india'
group by 1 
order by 2 desc
limit 10 

-- 15. categorizes the content based on the presence of the keywords as 'kill' and 	voilence 
-- in description field. label content contaning these keywords as 'bad' and all other content 
-- as 'good'. content how many item fall into each category. 
WITH new_table AS (
    SELECT *, 
        CASE 
            WHEN description ILIKE '%kill%' 
              OR description ILIKE '%violence%' 
            THEN 'Bad_content'
            ELSE 'Good_content'
        END AS category
    FROM netflix
)

SELECT 
    category,
    COUNT(*) AS total_content 
FROM new_table
GROUP BY 1;










 
