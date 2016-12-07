# PlayerValueTool

Below is a description of all of the procedures written for the MySQL database. Below each procedure the inputs to those procedures are listed.

Add Functionality
-----------------

The following procedures are used for adding to the database. Please not that each of these (excluding add_to_players_table) will throw an error if a player that does not exist in the error table is being used as an argument.

- Add_to_players_table : Adds a player to the players table
  - playerName
  - playerId
  - position
  - sportName
  - teamName
  - salary

- Add_baseball_hitter : Adds a player to the baseball hitter stats table
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

- Add_baseball_pitcher : Adds a player to the baseball pitcher stats table
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

- Add_basketball_player : Adds a player to the basketball player stats table
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

- Add_football_defensive_player :  Adds a player to the football defensive player stats table
  - playerId
  - approximateValue
  - totalTackles
  - assistedTackles
  - sacks
  - passesDefended
  - interceptions
  - forcedFumbles
  - defensiveTD

- Add_football_offensive_lineman : Adds a player to the football offensive lineman stats table
  - playerId
  - approximateValue
  - sacksAllowed
  - qbHits
  - qbHurries
  - penaltiesCommitted
  - penaltiesAccepted

- Add_football_skill_position_player : Adds a player to the football offensive player stats table
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

- delete_player : Deletes a player from the players table. This is a cascaded delete so the player is removed from the proper stat table as well
  - playerId
  
Update Functionality
--------------------

- update_players_team : Updates a player's team in the players table
  - playerId
  - newTeamName

- update_players_salary : Updates a player's salary in the players table
  - playerId
  - newSalary

Get Functionality
-----------------

- get_player : Get a player and their corresponding info and stats
  - playerId
- get_players_in_sport : Get all players that play a particular sport
  - sportName
