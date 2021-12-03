
# install Shiny: 
# install.packages("shiny")


#load shiny
library(shiny)

## Create basic app


#Define UI (User Interface)
ui <- fluidPage(
    "Hello, world!"
)

#Define Server side funtionality
server <- function(input, output, session) {
}

#Run UI and server together
shinyApp(ui, server)

#fluidPage() is a layout function that sets up the basic visual structure of the page

##Replace UI with following code:
ui <- fluidPage(
    selectInput("dataset_input", 
                label = "Dataset BITS", 
                choices = ls("package:datasets")),
    verbatimTextOutput("summary_output"),
    tableOutput("table_output")
)

# selectInput() is an input control that lets the user interact with the app
#by providing a value. In this case, it's a select box with the label "Dataset" 
#and lets you choose one of the built-in datasets that come with R. 

# verbatimTextOutput() and tableOutput() are output controls that tell Shiny 
#where to put rendered output (we'll get into the how in a moment). 
#verbatimTextOutput() displays code and tableOutput() displays tables.

## Inputs arguments
    # first argument: inputId. 
        # This is the identifier used to connect the front end with the back end.
        # if your UI has an input with ID "name", the server function will access 
        # it with input$name
    # second argument: label. 
        # Used to create a human-readable label for the control. 
        # Shiny doesn't place any restrictions on this string, 
            # but you'll need to carefully think about it to make sure that 
            # your app is usable by humans! 
    # third parameter is typically value, 
        # which, where possible, lets you set the default value.


server <- function(input, output, session) {
    
    output$summary_output <- renderPrint({
        dataset_output <- get(input$dataset_input, "package:datasets")
        summary(dataset_output)
    })
    
    output$table_output <- renderTable({
        dataset_output <- get(input$dataset_input, "package:datasets")
        dataset_output
    })
}



shinyApp(ui, server)


## Instead of generating value for a variable twice (once in UI and once in Server)
## Use Reactive

ui <- fluidPage(
    selectInput("dataset", 
                label = "Dataset BITS", 
                choices = ls("package:datasets")),
    verbatimTextOutput("summary"),
    tableOutput("table")
)

server <- function(input, output, session) {
    # Create a reactive expression
    dataset <- reactive({
        get(input$dataset, "package:datasets")
    })
    
    output$summary <- renderPrint({
        # Use a reactive expression by calling it like a function
        summary(dataset())
    })
    
    output$table <- renderTable({
        dataset()
    })
}

shinyApp(ui, server)

# Define UI for application that draws a histogram
xyz <- fluidPage(

    # Application title
    titlePanel("Random Data for Illustration"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 50,
                        value = 30)
            ), # sidebar panel ends here 
        
        # Show a plot of the generated distribution
        
        mainPanel(
           plotOutput("histPlot"),
           plotOutput("histPlot3"),
           plotOutput("histPlot2")
        )
    ) # main panel ends here
)

# Define server logic required to draw a histogram
pqr <- function(input, output) {

    output$histPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
    
    output$histPlot2 <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
    
    output$histPlot3 <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = xyz, server = pqr)
