library(shiny)
library(cluster)
library(datasets)
data(xclara)

xclara <- xclara
names(xclara) <- c("x","y")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("K-means Clustering Centroid Coordinates Calculator"),
  h3("Welcome!"),
  HTML("<b> Instructions: </b> <br>"),
  HTML("This shiny application aims to calculate for the centroid coordinates depending on the number of clusters that you have selected. You will also see the clusters plotted on the right side of this side bar. <br> <br>"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       numericInput("clusters",
                   "Number of clusters",
                   min = 1,
                   max = 15,
                   value = 1),
                   HTML("*Note that you can only choose from clusters 1-15 <br>")
                   

    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("clusplot"),
       HTML("<b>Calculated K-Means Cluster Centroid Coordinates</b>"),
       tableOutput("coords")
    )
  )
))
