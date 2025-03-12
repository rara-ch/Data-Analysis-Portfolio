USE afl_db;

CREATE TEMPORARY TABLE difference_win_homevaway AS 

WITH percentage_homeaway AS (		-- Pivot the team_games table and group by Team and HomeAway
						SELECT	 team, homeaway,
								 ROUND((COUNT(CASE WHEN result = 'W' THEN 1 ELSE NULL END) / COUNT(*)) * 100, 1) as win,
								 ROUND((COUNT(CASE WHEN result = 'L' THEN 1 ELSE NULL END) / COUNT(*)) * 100, 1) as loss,
								 ROUND((COUNT(CASE WHEN result = 'D' THEN 1 ELSE NULL END) / COUNT(*)) * 100, 1) as draw
						FROM 	 team_games
						WHERE 	 gameid NOT LIKE '%F%'
						GROUP BY team, homeaway
)
SELECT 	 pha1.team, 
		 pha1.win - pha2.win as diff_win_homeaway,
FROM 	 percentage_homeaway pha1 INNER JOIN percentage_homeaway pha2
		 ON pha1.team = pha2.team AND pha1.homeaway > pha2.homeaway;
         
SELECT 	 team, diff_win_homeaway,
		 ROW_NUMBER() OVER(ORDER BY diff_win_homeaway DESC) as diff_rank
FROM 	 difference_win_homevaway;

SELECT 	 AVG(diff_win_homeaway) as avg_diff
FROM 	 difference_win_homevaway;