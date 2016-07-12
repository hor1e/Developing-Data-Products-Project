library(shiny)
library(ggplot2)
library(Cairo)

# Define UI for application that plot iris data
ui <- shinyUI(fluidPage(
   
    # Application title
    titlePanel("Plot Iris Data"),
   
    # Sidebar
    sidebarLayout(
        sidebarPanel(
      
        # SelectBox to select X and Y
        selectInput("select_X", label = "X", 
                    choices = colnames(iris)[1:4], 
                    selected = colnames(iris)[1]),
      
        selectInput("select_Y", label = "Y", 
                    choices = colnames(iris)[1:4], 
                    selected = colnames(iris)[1]),
      
        # Checkbox to draw (or not) fitted line
        checkboxInput("checkbox", label = "Fitting liner model", value = TRUE)
      
        ),
    
    # Plot in main panel
    mainPanel(plotOutput("plot1"))
    
    )
))

# Define server logic required to draw a iris data
server <- shinyServer(function(input, output) {
    
    # Select box object
    output$select_X <- renderPrint({ input$select_X })
    output$select_Y <- renderPrint({ input$select_Y })
  
    # Plot object
    output$plot1 <- renderPlot({
        if (input$checkbox == TRUE){
            ggplot(data = iris, aes_string(x = input$select_X, y = input$select_Y, color = "Species")) + 
                geom_point() + geom_smooth(method = "lm") + 
                theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), 
                      legend.text = element_text(size = 12))

        } else {
            ggplot(data = iris, aes_string(x = input$select_X, y = input$select_Y, color = "Species")) + 
                geom_point() + 
                theme(axis.text=element_text(size=12), axis.title=element_text(size=14,face="bold"), 
                      legend.text = element_text(size = 12))
        }
    
    })
})

# Run the application 
shinyApp(ui = ui, server = server)

