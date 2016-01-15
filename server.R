
shinyServer(function(input,output) {
    #Lectura de la base de clima
    baseDatos <- reactive({
        
        dataBase <- input$dataBase
        
        
        baseFinal <- if (is.null(dataBase)){NULL}else{
            dPvalBase <- dataBase$name    
            path <- substring(dPvalBase,nchar(dPvalBase)-2,nchar(dPvalBase))
            
            while(is.null(dataBase)|path!="csv"){
                validate(need(!is.null(dataBase)& path=="csv" , "No se han cargado datos de clima en formato csv"))
            }   
            
            read.csv(dataBase$datapath)} 
        
        
        return(baseFinal)
    })
    
})
