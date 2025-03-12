USE afl_db;

-- Find out how each team performed over the years.

-- Get each team and all their games with their score and their opponents scores (not including finals).
WITH  team_games AS (
					SELECT 	 year, 
							 hometeam as Team, 
							 hometeamscore as TeamScore, 
							 awayteamscore as OpponentScore  
					FROM 	 games
                    WHERE 	 gameid NOT LIKE '%F%'
					UNION ALL
					SELECT 	 year,
							 awayteam as Team,
							 awayteamscore as TeamScore,
							 hometeamscore as OpponentScore 
					FROM 	 games
                    WHERE 	 gameid NOT LIKE '%F%'
),
-- Add a column that has the result of the team in the game.
       tg_result AS (
					SELECT 	 year, team, teamscore, opponentscore,
							 CASE
								WHEN teamscore > opponentscore THEN 'W'
								WHEN teamscore < opponentscore THEN 'L'
								WHEN teamscore = opponentscore THEN 'D'
							 END as result
					FROM 	 team_games
),
-- Pivot the table so that it shows the win, loss, and draw percentage of each team in each year
team_performance AS (
					SELECT	 year, team,
							 ROUND((COUNT(CASE WHEN result = 'W' THEN 1 ELSE NULL END) / COUNT(*)) * 100, 1) as win,
							 ROUND((COUNT(CASE WHEN result = 'L' THEN 1 ELSE NULL END) / COUNT(*)) * 100, 1) as loss,
							 ROUND((COUNT(CASE WHEN result = 'D' THEN 1 ELSE NULL END) / COUNT(*)) * 100, 1) as draw
					FROM 	 tg_result
					GROUP BY year, team
)
-- Add a column that ranks that seasons performance relative to the performances of other seasons of the same team.
-- Add a column that has the rolling average win percentage for each team.
-- Order the table by team and year.
SELECT 	 year, team, win, 
		 ROUND(AVG(win) OVER(PARTITION BY team ORDER BY year), 1) as rolling_win_avg,
		 loss, draw,
		 RANK() OVER(PARTITION BY team ORDER BY win DESC) as rank_of_season
FROM 	 team_performance
ORDER BY team, year;
