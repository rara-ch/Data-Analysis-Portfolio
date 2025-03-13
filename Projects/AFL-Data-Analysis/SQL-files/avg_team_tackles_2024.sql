USE afl_db;

WITH tackles_per_game AS (
			SELECT	 GameId, Team,
					 SUM(Tackles) as GameTackles
			FROM	 stats
			WHERE 	 year = 2024 AND GameID NOT LIKE '%F%'
			GROUP BY GameId, Team
),
avg_tackles_team AS (
			SELECT	 Team,
					 ROUND(AVG(GameTackles)) AS AverageTackles
			FROM 	 tackles_per_game
			GROUP BY Team
)
SELECT 	 Team, AverageTackles,
		 ROW_NUMBER() OVER(ORDER BY AverageTackles DESC) as SeasonTacklesRank
FROM 	 avg_tackles_team;
