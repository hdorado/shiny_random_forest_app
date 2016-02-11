baseFinal <- NULL

shinyUI(
    fluidPage(  tags$head(
        tags$style(HTML('#run{background-color:orange}'))
    ),
        fluidRow(
            
        
            column(12,
               
            titlePanel(strong("Análisis exploratorio e importancia de variables 
                              en un conjunto de datos multivariado:")),
               br(),
               
               p("Esta aplicación es útil para explorar bases de datos con 
                 salidas numéricas usando análisis bi variado y la importancia 
                 de variables en el algoritmo random forest."),
            br(),     
            p("A continuación, el usuario puede cargar los datos que quiere explorar; es 
               necesario que estén contenidos dentro de un archivo csv y que 
               mantengan un orden en el que las primeras variables sean las 
               entradas del modelo y la última la salida:"),
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
            h3(strong('Análisis exploratorio de datos'),align = "center" ),
            br(),
            p('Se puede generar un diagrama de dispersión para variables 
              cuantitativas y un diagrama de cajas y alambres para variables 
              cualitativas.

                El usuario puede seleccionar las variables que quiere
               incluir en el gráfico. Cuando ‘X’ y ‘Y’ son cuantitativos, una 
                suavización loess será agregada al gráfico.'),
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
                br(),
                p('A continuación se puede apreciar el orden de importancia en 
                  las variables de entrada. Entre más alto sea el valor, más 
                  relevante es en la explicación de la variable de salida.'),
                
                plotOutput("plotRelevance")
            )
        )
    )
)

