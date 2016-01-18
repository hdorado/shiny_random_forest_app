
library(ggplot2)

ggdescriptive <- function(dataSet,varOpc1,varOpc2)
{   
 
    tme <- theme_bw() +theme(legend.position="none")+
        theme(axis.title.x = element_text(size = 12),
            axis.title.y = element_text(size = 12),
            axis.text.x =  element_text(size = 12),
            axis.text.y =  element_text(size = 12,angle = 90, hjust = 0.5))

    varsToPlot        <- dataSet[c(varOpc1,varOpc2)]
    names(varsToPlot) <- c("x","y")      

    if(!is.factor(dataSet[varOpc1][,1]))
    {    
        lows <- with(varsToPlot,lowess(y~x))
        lowsMat <- data.frame(x=lows$x,y=lows$y)
    
       gf <- ggplot(varsToPlot,aes(x=x,y=y))+geom_point(colour="grey4",fill="blue",
        size=4,shape = 21,alpha =0.6)+tme+geom_line(aes(x=x,y=y),lwd=1.3,
        col="red", data=lowsMat)+xlab(varOpc1)+ ylab(varOpc2)
        
    }else{
    
    gf <- ggplot() + geom_boxplot(aes(x=x,y=y),data=varsToPlot,binaxis = "y",
                            stackdir = "center",colour="grey4", fill="aquamarine",
                            na.rm=T)+ylab(varOpc2)+
        xlab(varOpc1)+tme+ theme(axis.text.x = element_text(angle = 45, 
                                                            hjust = 1)) 
    }
    print(gf)
}


