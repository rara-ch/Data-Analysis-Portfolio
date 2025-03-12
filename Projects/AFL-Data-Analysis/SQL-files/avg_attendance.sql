USE afl_db;

-- Find out the average attendance for all the games.
SELECT 	 ROUND(AVG(CAST(REPLACE(attendance, ',', '') AS UNSIGNED))) as total_avg_attendance
FROM 	 games;


-- Create a temporary table that turns the attendance column into a numeric data type and select only the columns we will group by.
CREATE TEMPORARY TABLE attendance_figures AS
SELECT 	 team, venue,
	 CAST(REPLACE(attendance, ',', '') AS UNSIGNED) as attendance
FROM	 team_games;


-- Find the average by team. Order from highest to lowest average_attendance. 
SELECT 	 team,
	 ROUND(AVG(attendance)) as avg_attendance
FROM	 attendance_figures
GROUP BY team
ORDER BY avg_attendance DESC;


-- Find the average by venue and the number of games played at that venue. Order from highest to lowest average_attendance. 
SELECT 	 venue,
	 ROUND(AVG(attendance)) as avg_attendance,
         ROUND(COUNT(*) / 2) as games_played
FROM	 attendance_figures
GROUP BY venue
HAVING 	 ROUND(COUNT(*) / 2) >= 15
ORDER BY avg_attendance DESC;
