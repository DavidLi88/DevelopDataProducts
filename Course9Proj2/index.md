---
title       : Simulation for exponential distribution with Shiny
subtitle    : 
author      : David Li
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Simulation for exponential distribution with Shiny

* In Coursera Data Science course 6 - Statistical Inference Project Part 1, I had investigated the exponential distribution in R and compare it with the Central Limit Theorem. The exponential distribution can be simulated in R with rexp(n, lambda) where lambda is the rate parameter. The mean of exponential distribution is 1/lambda and the standard deviation is also 1/lambda.

* I have deveoped a Shiny app [https://davidli88.shinyapps.io/Course9Proj/](https://davidli88.shinyapps.io/Course9Proj/) to determine if the more number of exponentials or number of simulations, the closer of the simulation center to the theoretical center.

* In this Shiny app, you can play with different settings for lambda or the number of Exponentials or the number of simulations to find out if more Exponentials or simulations, the averages of samples follow normal distribution.

---

### ui.R
##### sidebarPanel
    sliderInput('lambda', 'lambda', min=0.01, max=10,
                value=0.2, step=0.01),
    sliderInput('ExpNum', 'Number of Exponentials', min=10, max=500,
                value=40, step=10, round=0),
    sliderInput('SimuNum', 'Number of Simulations', min=10, max=10000,
                value=1000, step=10, round=0),
    checkboxInput('showQQ', 'Show Normal Q-Q Plot')
  
##### mainPanel
    plotOutput('histPlot'),
    plotOutput('qqPlot')

---

### server.R
#### output$histPlot
    hist(row_means, breaks=50, prob=TRUE,
         main=paste("Density of means"), 
         xlab=paste("Theoretical center ",round(1/lambda,4)," vs Simulation center ",round(mean_simu,4)), 
         ylab="Density",
         col="lightblue")
  
#### output$qqPlot
    if (input$showQQ) {
      qqnorm(row_means)
      qqline(row_means, col = 2)
    }

---


![plot of chunk unnamed-chunk-2](assets/fig/unnamed-chunk-2-1.png)

![plot of chunk unnamed-chunk-3](assets/fig/unnamed-chunk-3-1.png)



