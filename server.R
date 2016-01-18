
library(ggplot2)
source(FunAppRF.R)

baseDatos <- NULL

shinyServer(function(input,output) {
    #Lectura de la base de clima
    baseDatos <- reactive({
        
        dataBase <- input$dataBase
        
        
        baseFinal <<- if (is.null(dataBase)){NULL}else{
            dPvalBase <- dataBase$name    
            path <- substring(dPvalBase,nchar(dPvalBase)-2,nchar(dPvalBase))
            
            while(is.null(dataBase)|path!="csv"){
                validate(need(!is.null(dataBase)& path=="csv" ,
                             "No se han cargado datos de clima en formato csv"))
            }   
            
            read.csv(dataBase$datapath)} 
        
        
        return(baseFinal)
    })
    
    namBD <- reactive({names(baseDatos())}[-1])
    
    output$namsx <- renderUI({
        selectInput("xvar","Variable X",as.list(namBD())) 
    })
    
    output$namsy <- renderUI({
        selectInput("yvar","Variable Y",as.list(namBD())) 
    })
    
    
    output$baseDatos <- renderTable({     
        if(is.null(baseDatos()))
            return(NULL)
        baseDatos()[1:5,][,1:5]
    })
    
    output$plotDescrip <- renderPlot(
        if(is.null(baseDatos))
            return(NULL)
        else(ggdescriptive(baseDatos(),input$formatoFecha,input$xvar,input$yvar))
    )
    
})
