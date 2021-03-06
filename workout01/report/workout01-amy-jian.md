Workout 1
================
Amy Jian
3/9/2019

Introduction
------------

The Golden State Warriors are currently one of the best teams in the NBA. Making field goals is one of the most important things in basketball, and the Warriors are definitely good at shooting. In 2016, their effective field goal percentage of 56.3% was the highest in the league and a significant bit higher than the next highest team, the San Antonio Spurs with an effective field goal percentage of 52.6%. The Warriors are good at shooting as a team; however, what about the individual players? This report will look at the 2016 shooting statistics and behaviors of 5 players from the Golden State Warriors: Andre Iguodala, Draymond Green, Kevin Durant, Klay Thompson, and Stephen Curry.

### Effective Shooting Percentages

##### 2 Point Field Goals

Below is a table of the percentages of 2-point field goals made for each player, arranged by shooting percentage in descending order:

``` r
pt2 <- shots[shots$shot_type == "2PT Field Goal", ] %>% group_by(name) %>% summarise(total = length(name), made = sum(shot_made_flag == "shot_yes"), perc_made = made/total) %>% arrange(desc(perc_made))
pt2
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   210   134     0.638
    ## 2 Kevin Durant     643   390     0.607
    ## 3 Stephen Curry    563   304     0.540
    ## 4 Klay Thompson    640   329     0.514
    ## 5 Draymond Green   346   171     0.494

Nearly all the players make 50% or more of their 2 point field goals. Durant and Curry make the most attempts at 2-point field goals, but while Iguodala makes the fewest attempts at 2-point field goals, he has the highest effective shooting percentage. Iguodala (63.8%) and Durant (60.7%) have significantly better shooting percentages than the others. Notably, Iguodala's effective shooting percentage is 10 percent higher than Curry's (54.0%), who is ranked third. Draymond Green has the lowest effective shooting percentage, 49.4%.

##### 3 Point Field Goals

Below is a table of the percentages of 3-point field goals made for each player, arranged by percentage in descending order:

``` r
pt3 <- shots[shots$shot_type == "3PT Field Goal", ] %>% group_by(name) %>% summarise(total = length(name), made = sum(shot_made_flag == "shot_yes"), perc_made = made/total) %>% arrange(desc(perc_made))
pt3
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Klay Thompson    580   246     0.424
    ## 2 Stephen Curry    687   280     0.408
    ## 3 Kevin Durant     272   105     0.386
    ## 4 Andre Iguodala   161    58     0.360
    ## 5 Draymond Green   232    74     0.319

These percentages are less than the 2-point shooting percentages, which is reasonable, given that 3-point field goals must be made for further away and therefore are harder to make. While Iguodala and Durant were ranked first and second for 2 point field goals, they rank fourth and third, respectively, for 3 point field goals. Thompson and Curry attempt the most 3 point field goals, and they have the highest 3 point field goal effective shooting percentages. There are no extremely large differences in the players' effective shooting percentages, with the exception of Green, who once again has the lowest effective shooting percentage.

##### Overall

Below is the table of overall effective shooting percentages for each player, arranged by percentage in descending order:

``` r
pt <- shots %>% group_by(name) %>% summarise(total = length(name), made = sum(shot_made_flag == "shot_yes"), perc_made = made/total) %>% arrange(desc(perc_made))
pt
```

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Kevin Durant     915   495     0.541
    ## 2 Andre Iguodala   371   192     0.518
    ## 3 Klay Thompson   1220   575     0.471
    ## 4 Stephen Curry   1250   584     0.467
    ## 5 Draymond Green   578   245     0.424

Each player has an overall effective shooting percentage less than that of the overall team's (56.3%). Durant did not have the highest 2 point or 3 point field goal effective shooting percentage, but is ranked first in terms of overall effective shotting percentage. Thompson and Curry attempt the most shots, and while they both make almost half of them, their overall effective shooting percentages are ranked third and fourth, respectively. Green has lowest overall effective shooting percentage at 42.4%.

### Shot Charts and Periods

Each point represents an attempted shot by the player. "shot\_yes" indicates that the shot was made, and "shot\_no" indicates a miss. <img src="../images/gsw-shot-charts.png" width="80%" style="display: block; margin: auto;" />

From this comparison, we can see that Iguodala attempts the fewest shots, while Thompson and Curry make the most attempts.

#### Andre Iguodala

There aren't many points on Iguodala's shot chart, indicating he doesn't shoot often. While there is no clear pattern to which shots he makes, Iguodala appears to favor shooting close to the basket or along the straight edges of the 3 point line at the side of the court.

#### Draymond Green

Draymond Green's shots appear to fall into 2 general clusters: close to the basket and in the paint, or just outside the curved section of the 3 point line. The red on his shot chart is quite noticable, indicating he misses often, more than he makes a basket. This is reflective of his effective shooting percentages.

#### Kevin Durant

Durant attempts more shots than Iguodala and Green. He appears to shoot from all locations inside the 3 point line. Outside the 3 point line, he appears to favor shooting along the curved section of the line. Interestingly, outside the 3 point line, he attempts less shots from the direct left of the basket than from the right (as seen by how there are less points on one side), but made nearly all the shots from the left side.

#### Klay Thompson

Thompson attempts many shots, all either inside or just outside the 3 point line. There does not appear to be a pattern for where he shoots from and his successes. Rather it seems that he attempts an approximately equal amount of 2 point and 3 point field goals.

#### Stephen Curry

Curry also attempts many shots. While he does shoot quite a bit from inside the 3 point line, the majority of his shots are 3 point field goals. His points are not clustered right outside 3 point line either; they seem to stretch towards half court. His shot chart suggests that he likes to shoot from farther away. He has even made several attempts at the basket from positions close to half court and far from the basket.

Conclusions
-----------

Stephen Curry attempts the most shots and likes to shoot far from the basket. Klay Thompson shoots just as often as Stephen Curry and has the highest 3 point field goal effective shooting percentage. While Andre Iguodala attempts the least amount of shots (an underwhelming 371 to Curry's 1250 and Thompson's 1220), he makes them count and has the highest 2 point field goal effective shooting percentage. Overall, Kevin Durant has the highest effective shooting percentage at 54.1 percent. While a stellar player, Draymond Green pales in comparison with the lowest effective shooting percentages in all areas and is this lineup's weakest player.

### References

-   <https://stats.nba.com/teams/advanced/?Season=2015-16&SeasonType=Regular%20Season&sort=EFG_PCT&dir=-1>
-   <https://www.nba.com/article/2017/12/14/one-team-one-stat-warriors-shooting-better-ever>
