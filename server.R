library(shiny)
function(input, output) {
  output$histPlot <- renderPlot({
    set.seed(333)
    lambda <- input$lambda
    num_simu <- input$SimuNum
    num_exp <- input$ExpNum
    simu <- matrix(rexp(num_simu*num_exp, rate=lambda), num_simu, num_exp)
    row_means <- rowMeans(simu)
    mean_simu <- mean(row_means)
    
    hist(row_means, breaks=50, prob=TRUE,
         main=paste("Density of means"), 
         xlab=paste("Theoretical center ",round(1/lambda,4)," vs Simulation center ",round(mean_simu,4)), 
         ylab="Density",
         col="lightblue")
    lines(density(row_means), col="blue")
    abline(v = mean_simu, col = "blue")
    abline(v = 1/lambda, col = "red")
    
    xfit <- seq(min(row_means), max(row_means), length=100)
    yfit <- dnorm(xfit, mean=1/lambda, sd=(1/lambda/sqrt(num_exp)))
    lines(xfit, yfit, pch=22, col="red", lty=2)
    legend('topright', c("simulation", "theoretical"), lty=c(1,2), col=c("blue", "red"))
  },700)
  
  output$qqPlot <- renderPlot({
    set.seed(333)
    lambda <- input$lambda
    num_simu <- input$SimuNum
    num_exp <- input$ExpNum
    simu <- matrix(rexp(num_simu*num_exp, rate=lambda), num_simu, num_exp)
    row_means <- rowMeans(simu)
    mean_simu <- mean(row_means)
    
    if (input$showQQ) {
      qqnorm(row_means)
      qqline(row_means, col = 2)
    }
  },700)
}
