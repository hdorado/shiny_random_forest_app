baseFinal <- NULL

shinyUI(
    fluidPage(  tags$head(
        tags$style(HTML('#run{background-color:orange}'))
    ),
        fluidRow(
            
        
            column(12,
               
            titlePanel(strong("Exploratory analysis and variable importance 
                                 for multivariate data:")),
               br(),
               
               p("This aplication is for exploring random forest models with a 
                 quantitative target; once the user has loaded a tidy database, 
                 immediately can start to: explore the correlation between two 
                 variables, identify the subset of relevants factor and reconoze 
                 the dependences between input and output."),
            br()     
          )
        ),
        fluidRow(
           
            column(4,p("") ),
            column(3,    
                  div(fileInput("dataBase",label = div(""),
                                accept = c('text/csv','text/comma-separated-values',                  
                                           'text/tab-separated-values',
                                           'text/plain',
                                           '.csv',
                                           '.tsv'),width='130%'))
            ),
            column(3,p(""))
        ),  
        
        fluidRow(
            column(12,
                div(tableOutput("baseDatos"),align="center"),
            h3(strong('Exploratory data analysis'),align = "center" ),
            br(),
            br()
            )        
        ),
        #sidebarPanel(
            
        fluidRow(
            column(6,div(uiOutput("namsx"),align = "center")),
            column(6,div(uiOutput("namsy"),align = "center"))
         #   ) 
        ),
        
        fluidRow(
            column(12,
                plotOutput("plotDescrip"),
                h3(strong("Importance relevance\nRandom Forest"),align="center"),
                plotOutput("plotRelevance")
            )
        )
    )
)

