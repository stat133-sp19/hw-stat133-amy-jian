Data dictionary:

The data is about shots made by Golden State Warriors players and the shot statisitics.

Below is a descirption of the variables in each player's shot data:

- team_name: the team the player played for
- game_date: the date the game was played
- season: the season during which the game was played
- period: the game period in which the shot occured
- minutes_remaining: number of minutes that remain to be played in the period at the time of the shot
- seconds_remaining: number of seconds that remain to be played in the period at the time of the shot
- shot_made_flag: indicates whether a shot was made(y) or missed(n)
    + In shots-data.csv, the values are recorded as "shot_yes" and "shot_no".
- action_type: the move used by the player to make the shot
- shot_type: indicates whether the shot was 2-point field goal or a 3-point field goal
- shot_distance: the distance to the basket, measured in feet
- opponent: the team the player was playing against
- x: the x coordinate (in inches) on the court where the shot occured
- y: the y coordinate (in inches) on the court where the shot occured

Additional variable found in shots-data.csv:
- name: the name of the player who made the shot
- minute: the minute number of the game when the shot occured