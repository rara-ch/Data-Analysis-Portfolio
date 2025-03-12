# AFL Data Analysis Project
## Aim
The aim of this project is to utise SQL, specifically MySQL and MySQL Workbench, to find interesting facts and insights 
about the Australian Football League (AFL) from the 2012 season to the 2024 season.
## Data
The data was sourced from Kaggle and can be found [here](https://www.kaggle.com/datasets/stoney71/aflstats). <br>
The database contains three CSV files:
- **games** (Primary Key: **GameID**) --> every game from the beginning of the 2012 season to the end of the 2024 season.
- **players** (Primary Key: **PlayerID**) --> every player who played in the AFL between the 2012 and 2024 seasons.
- **stats** (Foreign Keys: **GameID** and **PlayerID**)  --> all stats from each player from each game.
## Key Questions
### Team Analysis
1. How has each team performed from the 2012 to 2024 seasons?
2. What is the average attendance for each team?
3. How do different variables, such as different times, different days, wet versus dry, and home versus away, affect the performance
of each team?
### Player Analysis
4. Which players have the highest average perfomance in major statistics, such as disposals, goals, and marks?
5. What is the average number of brownlow votes for a player in a season? 
### General Analysis
6. For every score, what percentage of scores are goals versus behinds?
7. Has the average combined scores for games changed over the seasons?
8. For the 2024 season, what team averaged the most and least amount of tackles? What is the range of this and how did it impact team performance?
## Results
