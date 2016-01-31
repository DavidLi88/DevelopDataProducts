library(shiny)
fluidPage(
  
  titlePanel("Simulation for exponential distribution with Shiny"),
  helpText("In Coursera Data Science course 6 - Statistical Inference Project Part, I had investigated the exponential distribution in R and compare it with the Central Limit
Theorem. The exponential distribution can be simulated in R with rexp(n, lambda) where lambda is the rate
parameter. The mean of exponential distribution is 1/lambda and the standard deviation is also 1/lambda.
In this simulation tool, you can set lambda from 0.01 to 10, number of exponentials can be 10 to 500 and the number of simulations
can be 10 to 10000. You will see the more number of exponentials or number of simulations, the closer of the simulation center 
to the theoretical center."),
  sidebarPanel(
    sliderInput('lambda', 'lambda', min=0.01, max=10,
                value=0.2, step=0.01),
    sliderInput('ExpNum', 'Number of Exponentials', min=10, max=500,
                value=40, step=10, round=0),
    sliderInput('SimuNum', 'Number of Simulations', min=10, max=10000,
                value=1000, step=10, round=0),
    checkboxInput('showQQ', 'Show Normal Q-Q Plot')
  ),
  
  mainPanel(
    plotOutput('histPlot'),
    plotOutput('qqPlot')
  )
)
