library(shiny)
library(shinythemes)
library(shinyuieditor)

#launch_editor(app_loc = '.')

ui <- fluidPage(
  # getting a theme for the app
  theme = shinytheme("cerulean"),
  
  # navigation bar at the top of the app
  
  navbarPage(
    "Bioinformatics Analysis App",
    tabPanel(
      "RNA-Seq Analysis",
      mainPanel(
        tags$h2("Lab WorkStation")
        #, 
        #imageOutput("volcanoPlot") #verbatimTextOutput("txtout")
      ),
      sidebarPanel(
        tags$h3("Gene Quanitfication Input:"),
        fileInput("Files", label = NULL, multiple = TRUE, accept = c("csv", "text/csv","text/comma-separated-values"),
                  buttonLabel = "Browse PC...", width = 300),
        tags$hr(), actionButton("submit","Submit"),
        width = 5
        #textInput("txt1", "Lab Name:","")
      ),
      
      sidebarPanel(
        tags$h3("contents"),
        position = "Right",
        tableOutput("contents"),
        width = 7
      ),
      
      # this was imageOutput
      sidebarPanel(
        tags$h3("Volcano"),
        position = "Right",
        plotOutput("volcanoPlot", height ="500px", width = "500px"),
        width = 10
        
      )
    
    )
    
  )
  
  #selectInput("dataset", label = "Dataset", choices = ls("package:datasets")),
  #verbatimTextOutput("summary"),
  #tableOutput("table"),
  
)

source("feature_count.R")

server <- function(input, output, session) {
  # making the output show what was typed as input
  observeEvent(input$submit, {
    
    
    #v_plot_padj <- source("feature_count.R")$value
    
    
    output$contents <- renderPrint({
      req(input$Files)
      
      
      # I want to get the file names
      file_names = input$Files$name
      print(file_names)
      
      
      
      
      # here I want to get the file paths so I can use in the function
      #files = input$Files$datapath
      #result <- deseq2_analysis(files)
      
      #df <- read.csv(input$Files$datapath)
      #head(df)
    })
    
    
    
    # here i want to make a reactive timer that will invalidate after the time specified
    # then i will remove the notification once that happens
    #observe({
    #invalidateLater(50000, session)
    #removeNotification(id)
    #})
    
    #output$volcanoPlot <- renderImage({
    #  
    #  list(src = "./v_plot_padj.png",
    #       alt = "Volcano Plot showing Padj")},
    #  deleteFile = FALSE)
    
    # I want to show a notification when the "submit" button is clicked
    id <- showNotification("Currently conducting differential gene analysis. 
                     Please wait for results..", type = "message")
    
    # here I want to get the file paths so I can use in the function
    files = input$Files$datapath
    result <- deseq2_analysis(files)
    
    output$volcanoPlot <- renderPlot({
      # Loadnow the plot from the result of deseq2_analysis
      print(result)
    })
    
    # here I want to remove the notification only after the analysis is complete 
    on.exit(removeNotification(id))  
  })
  
  #output$txtout <- renderText({
  #  input$txt1
  #})
  
  # Create a reactive expression
  #dataset <- reactive({
   # get(input$dataset, "package:datasets")
  #})
  
  #output$summary <- renderPrint({
    # Use a reactive expression by calling it like a function
  #  summary(dataset())
  #})
  
  #output$table <- renderTable({
  #  dataset()
  #})
}

shinyApp(ui, server)
