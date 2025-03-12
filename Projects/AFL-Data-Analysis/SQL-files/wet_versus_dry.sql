USE afl_db;

WITH WetDry_tg AS (
				SELECT 	 team, venue, rainfall, result,
						 CASE
							WHEN rainfall > 0 AND venue != 'Docklands' THEN 'Wet'
							WHEN rainfall = 0 OR venue = 'Docklands' THEN 'Dry'
						 END AS WetDry 
				FROM 	 team_games
),
	    win_wd AS (
				SELECT 	 team, wetdry,
						 ROUND((COUNT(CASE WHEN result = 'W' THEN 1 ELSE NULL END) / COUNT(*)) * 100, 1) as Win
				FROM	 wetdry_tg
                GROUP BY team, wetdry
),
       win_wet AS (
				SELECT 	 wwd1.team, 
						 wwd1.win - wwd2.win as WetWin
				FROM 	 win_wd wwd1 INNER JOIN win_wd wwd2
						 ON wwd1.team = wwd2.team AND wwd1.wetdry > wwd2.wetdry
)
SELECT 	 team, wetwin,
		 RANK() OVER(ORDER BY wetwin DESC) as wet_win_rank
FROM 	 win_wet;