Workout 3
================
Amy Jian
5/3/2019

Overview
--------

'binomial' is a package that implements functionsfor calculating probabilities of a binomial random variable and other related caculations such as the probability distribution and expected value.

-   'bin\_choose( )' computes number of combinations of k successes in n trials
-   'bin\_probability( )' computes
-   'bin\_distribution( )' creates a 'bindis' object, a data frame of the probability distribution
-   'bin\_cumulative( )' creates 'bincum' object, a data frame of the cumulative probability distribution
-   'plot( ) method for 'bindis' and 'bincum' objects to plot probabilities of successes
-   'bin\_var' creates a 'binvar' object
-   'summary( )' method for 'binvar' object
-   individual summary measures:
    -   'bin\_mean( )'
    -   'bin\_variance( )'
    -   'bin\_mode( )'
    -   'bin\_skewness( )'
    -   'bin\_kurtosis( )'

Usage
-----

``` r
library(binomial)
```

``` r
#number of combinations of 3 successes in 5 trials
bin_choose(n = 5, k = 3)
```

    ## [1] 10

``` r
#probability of 3 successes in 5 trials with success probability 0.7
bin_probability(success = 3, trials = 5, prob = 0.7)
```

    ## [1] 0.3087

``` r
#binomial probability distribution
dis1 <- bin_distribution(trials = 5, prob = 0.7)
dis1
```

    ##   success probability
    ## 1       0     0.00243
    ## 2       1     0.02835
    ## 3       2     0.13230
    ## 4       3     0.30870
    ## 5       4     0.36015
    ## 6       5     0.16807

``` r
#plot probability distribution
plot(dis1)
```

![](README_files/figure-markdown_github/unnamed-chunk-5-1.png)

``` r
#binomial cumulative distribution
dis2 <- bin_cumulative(trials = 5, prob = 0.7)
dis2
```

    ##   success probability cumulative
    ## 1       0     0.00243    0.00243
    ## 2       1     0.02835    0.03078
    ## 3       2     0.13230    0.16308
    ## 4       3     0.30870    0.47178
    ## 5       4     0.36015    0.83193
    ## 6       5     0.16807    1.00000

``` r
#plot cumulative distribution
plot(dis2)
```

![](README_files/figure-markdown_github/unnamed-chunk-7-1.png)

``` r
#binomial random variable
bin <- bin_variable(trials = 5, prob = 0.7)
bin
```

    ## "Binomial variable" 
    ##  
    ## Parameters 
    ## - number of trials: 5 
    ## - prob of success: 0.7

``` r
#summary of a binomial random variable
summary(bin)
```

    ## "Summary Binomial" 
    ##  
    ## Parameters 
    ## - number of trials: 5 
    ## - prob of success: 0.7 
    ##  
    ## Measures 
    ## - mean    : 3.5 
    ## - variance: 1.05 
    ## - mode    : 4 
    ## - skewness: -0.39036 
    ## - kurtosis: -0.247619

``` r
#indiviudal summary measures
bin_mean(trials = 5, prob = 0.7)
```

    ## [1] 3.5

``` r
bin_variance(trials = 5, prob = 0.7)
```

    ## [1] 1.05

``` r
bin_mode(trials = 5, prob = 0.7)
```

    ## [1] 4

``` r
bin_skewness(trials = 5, prob = 0.7)
```

    ## [1] -0.39036

``` r
bin_kurtosis(trials = 5, prob = 0.7)
```

    ## [1] -0.247619
