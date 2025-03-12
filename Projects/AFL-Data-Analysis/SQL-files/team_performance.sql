USE afl_db;

-- Find out how each team performed over the years (excluding finals).

WITH team_performance AS ( 											-- Pivot the team_games table
			SELECT	 year, team,
					 ROUND((COUNT(CASE WHEN result = 'W' THEN 1 ELSE NULL END) / COUNT(*)) * 100, 1) as win,
					 ROUND((COUNT(CASE WHEN result = 'L' THEN 1 ELSE NULL END) / COUNT(*)) * 100, 1) as loss,
					 ROUND((COUNT(CASE WHEN result = 'D' THEN 1 ELSE NULL END) / COUNT(*)) * 100, 1) as draw
			FROM 	 team_games
    			WHERE 	 gameid NOT LIKE '%F%'
			GROUP BY year, team
)
/* Add a column that ranks that seasons performance relative to the performances of other seasons of the same team.
   Add a column that has the rolling average win percentage for each team.
   Order the table by team and year. */
SELECT 	 year, team, win, 
		 ROUND(AVG(win) OVER(PARTITION BY team ORDER BY year), 1) as rolling_win_avg,
		 loss, draw,
		 RANK() OVER(PARTITION BY team ORDER BY win DESC) as rank_of_season
FROM 	 team_performance
ORDER BY team, year;

-- We can alter this query slightly to find out which teams had the best overall seasons and what those seasons were.

WITH team_performance AS ( 									
			SELECT	 year, team,
					 ROUND((COUNT(CASE WHEN result = 'W' THEN 1 ELSE NULL END) / COUNT(*)) * 100, 1) as win,
					 ROUND((COUNT(CASE WHEN result = 'L' THEN 1 ELSE NULL END) / COUNT(*)) * 100, 1) as loss,
					 ROUND((COUNT(CASE WHEN result = 'D' THEN 1 ELSE NULL END) / COUNT(*)) * 100, 1) as draw
			FROM 	 team_games
    			WHERE 	 gameid NOT LIKE '%F%'
			GROUP BY year, team
)
SELECT 	 year, team, win, loss, draw,
		 RANK() OVER(ORDER BY win DESC) as rank_of_season				-- Partition by the whole table instead of just the Team column.
FROM 	 team_performance;	
