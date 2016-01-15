shinyUI(
    fluidPage(
        
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
           
            column(3,p("") ),
            column(3,    
                  div(fileInput("dataBase",label = div(""),
                                accept = c('text/csv','text/comma-separated-values',                  
                                           'text/tab-separated-values',
                                           'text/plain',
                                           '.csv',
                                           '.tsv'),width='130%'))
            ),
            column(4,p(""))
        )  
               
    )
)

