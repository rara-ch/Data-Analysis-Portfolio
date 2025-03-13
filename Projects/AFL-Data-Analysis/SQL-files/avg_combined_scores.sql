USE afl_db;

WITH combined_scores AS (
			SELECT 	 GameID, Year,
				 HomeTeamScore + AwayTeamScore as CombinedScore
			FROM 	 games
)
SELECT 	 year,
		 ROUND(AVG(CombinedScore)) as AvgCombinedScore
FROM 	 combined_scores
GROUP BY year
ORDER BY year;
