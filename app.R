library(shiny)
library(ggplot2)

# Define UI for application that plot iris data
ui <- shinyUI(fluidPage(
   
    # Application title
    titlePanel("Plotting Iris with Shiny Application"),
   
    # Sidebar
    sidebarLayout(
        sidebarPanel(
            
            # SelectBox to select X and Y
            selectInput("select_X", label = "Choose X", 
                        choices = colnames(iris)[1:4], 
                        selected = colnames(iris)[1]),
      
            selectInput("select_Y", label = "Choose Y", 
                        choices = colnames(iris)[1:4], 
                        selected = colnames(iris)[1]),
            
            helpText("The graph will be automatically plotted when you choose X and Y."),
      
            # Checkbox to draw (or not) fitted line
            hr(),
            checkboxInput("checkbox", label = "Fitting liner model", value = TRUE),
            
            helpText("The graph can be added fitted line by check box.")
      
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

