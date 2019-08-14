
library(shiny)
library(cluster)
data(xclara)
xclara <- xclara
names(xclara) <- c("x","y")

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  clusters <- reactive({
    kmeans(xclara, input$clusters, iter.max = 10)
  })
  
  output$clusplot <- renderPlot({
    palette(c("#C9B1FF", "#FFCAF2", "#FFB2B1", "#FFF3AD",
              "#BCFFBC", "#A2EDFF", "#5B41C1", "#51535A", "#5893E0", "#003366", "#58E55C", "#FCF04E", "#B20710", "#d695ef", "#ff42c1"))
    par(mar = c(5.1, 4.1, 0, 1))
    plot(xclara, col = clusters()$cluster, pch = 1, cex = 1)
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })
  output$coords <- renderTable({clusters()$centers})
    
  })
  

