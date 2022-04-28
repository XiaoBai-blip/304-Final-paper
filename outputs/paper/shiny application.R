#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput(
              inputId = "number_of_bins",
              label = "Number of bins:",
              min = 1,
              max = 50,
              value = 30)
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
      
        # Draw the histogram with the specified number of bins
        blood_pressure %>% 
          filter(Number_of_responding_apparatus < 35)%>%
          ggplot(aes(x = Number_of_responding_apparatus)) +
          geom_histogram(fill = "orange", color="black", bins = input$number_of_bins)
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
