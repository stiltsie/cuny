# 1. Which destination in the flights database is the furthest distance away, based on information in the flights table.
# Show the SQL query(s) that support your conclusion.

select dest, max(distance)
from flights
order by distance, dest

# 2. What are the different numbers of engines in the planes table? For each number of engines, which aircraft have
# the most number of seats? Show the SQL statement(s) that support your result.

select distinct engines
from planes

# 3. Show the total number of flights.

select count(*)
from flights

# 4. Show the total number of flights by airline (carrier).

select distinct carrier, count(*)
from flights
group by carrier
order by carrier asc

# 5. Show all of the airlines, ordered by number of flights in descending order.

select carrier, count(*)
from flights
group by carrier
order by count(*) desc

# 6. Show only the top 5 airlines, by number of flights, ordered by number of flights in descending order.

select carrier, count(*)
from flights
group by carrier
order by count(*) desc
limit 5

# 7. Show only the top 5 airlines, by number of flights of distance 1,000 miles or greater, ordered by number of
# flights in descending order.

select carrier, count(*)
from flights
where distance > 1000
group by carrier
order by count(*) desc
limit 5

# 8. Create a question that (a) uses data from the flights database, and (b) requires aggregation to answer it, and
# write down both the question, and the query that answers the question.

# Show the number of flights delayed by more than 30 mins by carrier

select carrier, count(*)
from flights
where arr_delay > 30
group by carrier
order by count(*) desc