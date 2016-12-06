# PlayerValueTool

Below is a description of all of the procedures written for the MySQL database. Below each procedure the inputs to those procedures are listed.

Add Functionality
-----------------

The following procedures are used for adding to the database. Please not that each of these (excluding add_to_players_table) will throw an error if a player that does not exist in the error table is being used as an argument.

- Add_to_players_table
  - playerName
  - playerId
  - position
  - sportName
  - teamName
  - salary

- Add_baseball_hitter
  - playerId
  - atBats
  - runsScored
  - hits
  - doubles
  - triples
  - homeruns
  - runsBattedIn
  - stolenBases
  - caughtStealing
  - walksDrawn
  - strikeouts
  - battingAverage
  - onBasePercentage
  - sluggingPercentage
  - onBasePlusSlugging
  - winsAboveReplacement

- Add_baseball_pitcher
  - playerId
  - gamesPitched
  - gamesStarted
  - inningsPitched
  - hitsAllowed
  - runsGivenUp
  - earnedRuns
  - walksAllowed
  - strikeouts
  - wins
  - losses
  - saves
  - blownSaves
  - walksPlusHitsAllowedPerInningsPitched
  - earnedRunAverage
  - winsAboveReplacement

- Add_basketball_player
  - playerId
  - gamesPlayed
  - playerEfficiencyRating
  - pointsPerGame
  - reboundsPerGame
  - assistsPerGame
  - stealsPerGame
  - blocksPerGame
  - fieldGoalPercentage
  - trueShhotingPercentage
  - usagePercentage
  - valueOverReplacementPlayer

- Add_football_defensive_player
  - playerId
  - approximateValue
  - totalTackles
  - assistedTackles
  - sacks
  - passesDefended
  - interceptions
  - forcedFumbles
  - defensiveTD

- Add_football_offensive_lineman
  - playerId
  - approximateValue
  - sacksAllowed
  - qbHits
  - qbHurries
  - penaltiesCommitted
  - penaltiesAccepted

- Add_football_skill_position_player
  - playerId
  - approximateValue
  - passingYards
  - passingTD
  - yardsPerCompletion
  - yardsPerAttempt
  - completionPercentage
  - rushingAttempts
  - rushingYards
  - rushingTD
  - targets
  - receptions
  - receivingYards
  - receivingTD
  - fumbles
  - interceptions
  
Delete Functionality
--------------------

The following procedure is used to delete a player from the players table and subsequently removes that player from the other tables the player is in.

- delete_player
  - playerId
  
Update Functionality
--------------------

There are currently procedures to update values in the players table. There are two procedures there to update a player's salary and their team respectively.

- update_players_team
  - playerId
  - newTeamName

- update_players_salary
  - playerId
  - newSalary

Get Functionality
-----------------

There are procedures in place to get a player from the players table as well as their corresponding stats from the proper table. These procedures are currently all taking in the player name and the sport name. There is also a procedure that takes in a sport and gets all of the player ids for the players in that sport.


- get_baseball_hitter
- get_baseball_pitcher
- get_basketball_player
- get_football_defensive_player
- get_football_offensive_lineman
- get_football_skill_position_player
- get_players_in_sport
  - sportName
